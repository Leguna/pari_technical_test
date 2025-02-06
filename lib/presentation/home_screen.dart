import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../data/item_mdl.dart';
import 'detail_screen.dart';

HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
  HttpLogger(logLevel: LogLevel.BODY),
]);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> items = [];
  late Item singleItem;
  String message = '';

  final String apiUrl = 'https://api.restful-api.dev/objects';

  Future<void> fetchItems() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      final List<Item> items = itemFromJson(response.body);
      if (response.statusCode == 200) {
        setState(() {
          this.items = items;
          message = 'Items fetched successfully!';
        });
      } else {
        setState(() {
          message =
              'Failed to fetch items. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  Future<void> fetchSingleItem(String id,
      {required Function(Item) onFinish}) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 200) {
        onFinish(Item.fromJson(json.decode(response.body)));
        setState(() {
          singleItem = Item.fromJson(json.decode(response.body));
          message = 'Item fetched successfully!';
        });
      } else {
        setState(() {
          message = 'Failed to fetch item. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  Future<void> addItem(String name, String description, double price) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'description': description,
          'price': price,
        }),
      );
      if (response.statusCode == 201) {
        setState(() {
          message = 'Item added successfully!';
        });
        fetchItems();
      } else {
        setState(() {
          message = 'Failed to add item. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  Future<void> updateItem(
      String id, String name, String description, double price) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'description': description,
          'price': price,
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          message = 'Item updated successfully!';
        });
        fetchItems();
      } else {
        setState(() {
          message =
              'Failed to update item. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 200) {
        setState(() {
          message = 'Item deleted successfully!';
        });
        fetchItems();
      } else {
        setState(() {
          message =
              'Failed to delete item. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: fetchItems,
        child: ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (items.isEmpty) {
              return const ListTile(
                title: Text("No items found"),
              );
            }
            if (index == (items.length)) {
              return const SizedBox(height: 64);
            }
            final item = items[index];
            return ListTile(
              title: Text(item.name ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showUpdateDialog(item.id),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteItem(item.id),
                  ),
                ],
              ),
              onTap: () => fetchSingleItem(item.id, onFinish: (item) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              }),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name')),
              TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description')),
              TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addItem(
                  nameController.text,
                  descriptionController.text,
                  double.parse(priceController.text),
                );
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(String id) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name')),
              TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description')),
              TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                updateItem(
                  id,
                  nameController.text,
                  descriptionController.text,
                  double.parse(priceController.text),
                );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
