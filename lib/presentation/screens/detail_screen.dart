import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pari_technical_test/presentation/widgets/my_app_bar.dart';
import 'package:pari_technical_test/presentation/widgets/my_loading.dart';

import '../../core/models/item_mdl.dart';
import '../../domain/bloc/item_cubit.dart';
import '../resources/dialog_utils.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({
    super.key,
    this.id = '1',
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ItemCubit>();
    cubit.fetchSingleItem(id);
    return BlocConsumer<ItemCubit, ItemState>(
      listener: (context, state) {
        state.maybeWhen(
          deleted: (message) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.green,
              ),
            );
          },
          success: (message) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.green,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final item = cubit.selectedItem;
        final isAdded = cubit.isAdded(item);
        return Stack(
          children: [
            Scaffold(
              appBar: MyAppBar(
                title: Text(item.name.isEmpty ? '-' : item.name),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () => cubit.fetchSingleItem(id),
                  ),
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
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${item.id.isEmpty ? '-' : item.id}',
                          style: const TextStyle(fontSize: 16)),
                      Wrap(
                        children: [
                          Text(
                            'Name: ${item.name.isEmpty ? '-' : item.name}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (item.data != null) _buildDataDetails(item.data!),
                    ],
                  ),
                ),
              ),
            ),
            state.maybeWhen(
              loading: (showLoading) {
                return const MyLoading();
              },
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDataDetails(Data data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.dataCapacity != null || data.capacity != null)
          Text('Capacity: ${data.dataCapacity ?? data.capacity}'),
        if (data.capacityGb != null) Text('Capacity (GB): ${data.capacityGb}'),
        if (data.price != null || data.dataPrice != null)
          Text('Price: ${data.price ?? data.dataPrice}\$'),
        if (data.dataGeneration != null)
          Text('Generation: ${data.dataGeneration}'),
        if (data.generation != null) Text('Generation: ${data.generation}'),
        if (data.year != null) Text('Year: ${data.year}'),
        if (data.cpuModel != null) Text('CPU Model: ${data.cpuModel}'),
        if (data.hardDiskSize != null)
          Text('Hard Disk Size: ${data.hardDiskSize}'),
        if (data.strapColour != null) Text('Strap Colour: ${data.strapColour}'),
        if (data.caseSize != null) Text('Case Size: ${data.caseSize}'),
        if (data.color != null) Text('Color: ${data.color}'),
        if (data.dataColor != null) Text('Color: ${data.dataColor}'),
        if (data.description != null) Text('Description: ${data.description}'),
        if (data.screenSize != null)
          Text('Screen Size: ${data.screenSize} inches'),
      ],
    );
  }
}
