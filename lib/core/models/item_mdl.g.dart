// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'data': instance.data,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      dataColor: json['color'] as String?,
      dataCapacity: json['capacity'] as String?,
      capacityGb: (json['capacity GB'] as num?)?.toInt(),
      dataPrice: (json['price'] as num?)?.toDouble(),
      price: json['Price'] as String?,
      dataGeneration: json['generation'] as String?,
      year: (json['year'] as num?)?.toInt(),
      cpuModel: json['CPU model'] as String?,
      hardDiskSize: json['Hard disk size'] as String?,
      strapColour: json['Strap Colour'] as String?,
      caseSize: json['Case Size'] as String?,
      color: json['Color'] as String?,
      description: json['Description'] as String?,
      capacity: json['Capacity'] as String?,
      screenSize: (json['Screen size'] as num?)?.toDouble(),
      generation: json['Generation'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'color': instance.dataColor,
      'capacity': instance.dataCapacity,
      'capacity GB': instance.capacityGb,
      'price': instance.dataPrice,
      'Price': instance.price,
      'generation': instance.dataGeneration,
      'year': instance.year,
      'CPU model': instance.cpuModel,
      'Hard disk size': instance.hardDiskSize,
      'Strap Colour': instance.strapColour,
      'Case Size': instance.caseSize,
      'Color': instance.color,
      'Description': instance.description,
      'Capacity': instance.capacity,
      'Screen size': instance.screenSize,
      'Generation': instance.generation,
    };
