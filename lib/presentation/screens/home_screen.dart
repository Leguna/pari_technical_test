import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pari_technical_test/domain/bloc/item_cubit.dart';

import '../../core/models/item_mdl.dart';
import '../../main.dart';
import '../widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ItemCubit>();
    context.read<ItemCubit>().fetchItems();
    return BlocConsumer<ItemCubit, ItemState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (e) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e),
                backgroundColor: Colors.red,
              ),
            );
          },
          success: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.green,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: MyAppBar(
                title: Text(title),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.clear_all),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete all added items?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  cubit.clearAddedItems();
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  cubit.fetchItems();
                },
                child: ListView.builder(
                  itemCount: cubit.items.length + 1,
                  itemBuilder: (context, index) {
                    if (cubit.items.isEmpty) {
                      return const ListTile(
                        title: Text("No items found"),
                      );
                    }
                    if (index == (cubit.items.length)) {
                      return const SizedBox(height: 64);
                    }
                    final item = cubit.items[index];
                    final isAdded = cubit.itemsAdded.contains(item);
                    return ListTile(
                      title: Text(item.name),
                      subtitle: (item.data?.description?.isEmpty ?? true) &&
                              (item.data?.combinedPrice?.isEmpty ?? true)
                          ? null
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (item.data?.combinedPrice?.isNotEmpty ?? false)
                                  Wrap(children: [
                                    Text('Price: ${item.data?.combinedPrice ?? ''}\$')
                                  ]),
                                if (item.data?.description?.isNotEmpty ?? false)
                                Wrap(children: [
                                  Text(item.data?.description ?? '')
                                ])
                              ],
                            ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isAdded)
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showUpdateDialog(item, context);
                              },
                            ),
                          if (isAdded)
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => cubit.deleteItem(item.id),
                            ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                      onTap: () {
                        context.push(detailPath(item.id), extra: item.toJson());
                      },
                    );
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => _showAddDialog(context),
                child: const Icon(Icons.add),
              ),
            ),
            state.maybeWhen(
              loading: (showLoading) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              empty: () => const Center(
                child: Text('No items found'),
              ),
              orElse: () => const SizedBox(),
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog(BuildContext context) {
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

  void _showUpdateDialog(Item item, BuildContext context) {
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
}
