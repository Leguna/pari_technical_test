import 'dart:convert';

import 'package:pari_technical_test/data/data_source/error_middleware.dart';
import 'package:pari_technical_test/data/data_source/local_database.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../core/models/item_mdl.dart';

class ItemRepository {
  final LocalDatabase localDatabase = LocalDatabase();
  final String apiUrl = 'https://api.restful-api.dev/objects';
  late HttpWithMiddleware http;

  ItemRepository() {
    if (apiUrl.isEmpty) {
      throw Exception('API_URL environment variable is not set.');
    }
    http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
      ErrorAdapterMiddleware(),
    ]);
  }

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(apiUrl));
    final List<Item> items = itemFromJson(response.body);
    if (response.statusCode == 200) {
      return items;
    } else {
      throw Exception(
          'Failed to fetch items. Status code: ${response.statusCode}');
    }
  }

  Future<List<Item>> fetchAddedItems() async {
    final ids = await localDatabase.getKeys();
    List<String> idsString = [];
    for (var id in ids) {
      if (ids == null) continue;
      idsString.add(id);
    }
    if (idsString.isEmpty) return [];
    final List<Item> items = await fetchMultipleItems(idsString);
    return items;
  }

  Future<void> clearAddedItems() async {
    await localDatabase.clearBox();
  }

  Future<List<Item>> fetchMultipleItems(List<String> ids) async {
    String idsPath = "";
    for (var id in ids) {
      idsPath += 'id=$id&';
    }
    final url = '$apiUrl?$idsPath';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return itemFromJson(response.body);
    } else {
      throw Exception(
          'Failed to fetch items. Status code: ${response.statusCode}');
    }
  }

  Future<Item> fetchSingleItem(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));
    if (response.statusCode == 200) {
      return Item.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to fetch item. Status code: ${response.statusCode}');
    }
  }

  Future<Item> addItem(String name, String description, String price) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        if (name.isNotEmpty) 'name': name,
        'data': {
          if (description.isNotEmpty) 'Description': description,
          if (price.isNotEmpty) 'Price': price,
        },
      }),
    );
    final item = Item.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      await localDatabase.setString(item.id, item.name);
      return item;
    } else {
      throw Exception(
        'Failed to add item.',
      );
    }
  }

  Future<Item> updateItem(
      String id, String? name, String? description, String? price) async {
    final dataToUpdate = {
      if (name?.isNotEmpty ?? false) 'name': name,
      'data': {
        if (description?.isNotEmpty ?? false) 'Description': description,
        if (price?.isNotEmpty ?? false) 'Price': price,
      },
    };

    if (dataToUpdate['data'] == {}) {
      dataToUpdate.remove('data');
    }

    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(dataToUpdate),
    );
    if (response.statusCode == 200) {
      final item = Item.fromJson(json.decode(response.body));
      await localDatabase.setString(item.id, item.name);
      return item;
    } else {
      throw Exception('Failed to update item.');
    }
  }

  Future<String> deleteItem(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode == 200) {
      await localDatabase.clearKey(id);
      return json.decode(response.body)['message'];
    } else {
      throw Exception('Failed to delete item.');
    }
  }
}
