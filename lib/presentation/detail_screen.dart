import 'package:flutter/material.dart';

import '../data/item_mdl.dart';

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${item.id}', style: const TextStyle(fontSize: 16)),
              Wrap(
                children: [
                  Text(
                    'Name: ${item.name}',
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
          Text('Price: ${data.price ?? data.dataPrice}'),
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
