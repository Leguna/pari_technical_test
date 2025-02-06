import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/error_utils.dart';
import '../../data/data_source/item_repository.dart';
import '../../data/models/item_mdl.dart';
import '../../main.dart';

part 'item_cubit.freezed.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(const ItemState.initial());
  final ItemRepository itemRepository = getIt<ItemRepository>();

  List<Item> items = [];
  List<Item> itemsAdded = [];
  Item selectedItem = const Item();

  Future<void> fetchItems() async {
    emit(ItemState.loading(showLoading: items.isEmpty));
    try {
      final defaultItem = await itemRepository.fetchItems();
      itemsAdded = await itemRepository.fetchAddedItems();
      items = [...defaultItem, ...itemsAdded];
      if (items.isEmpty) {
        emit(const ItemState.empty());
      } else {
        emit(ItemState.loaded(items));
      }
    } catch (e) {
      emit(ItemState.error(extractErrorMessage(e)));
    }
  }

  Future<void> fetchSingleItem(String id) async {
    selectedItem = const Item();
    emit(const ItemState.loading());
    try {
      selectedItem = await itemRepository.fetchSingleItem(id);
      emit(ItemState.singleLoaded(selectedItem));
    } catch (e) {
      emit(ItemState.error(extractErrorMessage(e)));
    }
  }

  Future<void> addItem(String name, String description, String price) async {
    emit(const ItemState.loading());
    try {
      if (name.isEmpty || description.isEmpty || price.isEmpty) {
        throw Exception('All fields are required.');
      }
      await itemRepository.addItem(name, description, price);
      await fetchItems();
    } catch (e) {
      emit(ItemState.error(extractErrorMessage(e)));
    }
  }

  Future<void> updateItem(
      String id, String name, String description, String price) async {
    emit(const ItemState.loading());
    try {
      if (name.isEmpty) {
        throw Exception('Name is required.');
      }

      if (name.isEmpty && description.isEmpty && price.isEmpty) {
        throw Exception('All fields are required.');
      }
      final updatedItem =
          await itemRepository.updateItem(id, name, description, price);
      await fetchItems();
      emit(ItemState.success("Item updated: ${updatedItem.name}"));
    } catch (e) {
      emit(ItemState.error(extractErrorMessage(e)));
    }
  }

  Future<void> deleteItem(String id) async {
    emit(const ItemState.loading());
    try {
      final message = await itemRepository.deleteItem(id);
      await fetchItems();
      emit(ItemState.success(message));
    } catch (e) {
      emit(ItemState.error(extractErrorMessage(e)));
    }
  }

  Future<void> clearAddedItems() async {
    try{
      await itemRepository.clearAddedItems();
      itemsAdded = [];
      await fetchItems();
    } catch (e) {
      emit(ItemState.error(extractErrorMessage(e)));
    }
  }
}
