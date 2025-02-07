import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pari_technical_test/domain/bloc/item_cubit.dart';
import 'package:pari_technical_test/presentation/widgets/my_loading.dart';

import '../../config/route.dart';
import '../../features/theme/bloc/theme_cubit.dart';
import '../resources/dialog_utils.dart';
import '../widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ItemCubit>();
    cubit.fetchItems();
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
                    icon: const Icon(Icons.brightness_4),
                    onPressed: () {
                      context.read<ThemeCubit>().changeTheme();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear_all),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SingleChildScrollView(
                            child: AlertDialog(
                              title: const Text('Delete all added items?'),
                              content: const Text(
                                  'This action will delete all added items. Are you sure?'),
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
                            ),
                          ),
                        );
                      },
                    ),
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
                    final isAdded = cubit.isAdded(item);
                    return ListTile(
                      title: Text(item.name),
                      subtitle: (item.data?.description?.isEmpty ?? true) &&
                              (item.data?.combinedPrice?.isEmpty ?? true)
                          ? null
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (item.data?.combinedPrice?.isNotEmpty ??
                                    false)
                                  Wrap(children: [
                                    Text(
                                        'Price: ${item.data?.combinedPrice ?? ''}\$')
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
                              onPressed: () => showUpdateDialog(item, context),
                            ),
                          if (isAdded)
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => showDeleteDialog(item, context),
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
                onPressed: () => showAddDialog(context),
                child: const Icon(Icons.add),
              ),
            ),
            state.maybeWhen(
              loading: (showLoading) {
                return const MyLoading();
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
}
