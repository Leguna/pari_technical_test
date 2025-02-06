import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/item_mdl.dart';
import '../../domain/bloc/item_cubit.dart';

void showAddDialog(BuildContext context) {
  final cubit = context.read<ItemCubit>();
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
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
              cubit.addItem(
                nameController.text,
                descriptionController.text,
                priceController.text,
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
void showUpdateDialog(Item item, BuildContext context) {
  final cubit = context.read<ItemCubit>();
  TextEditingController nameController =
  TextEditingController(text: item.name);
  TextEditingController descriptionController =
  TextEditingController(text: item.data?.description ?? '');
  TextEditingController priceController =
  TextEditingController(text: item.data?.combinedPrice ?? '');
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              keyboardType: TextInputType.number,
            ),
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
              cubit.updateItem(
                item.id,
                nameController.text,
                descriptionController.text,
                priceController.text,
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
void showDeleteDialog(Item item, BuildContext context) {
  final cubit = context.read<ItemCubit>();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Item'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cubit.deleteItem(item.id);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
