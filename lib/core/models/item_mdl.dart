import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_mdl.freezed.dart';
part 'item_mdl.g.dart';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Item with _$Item {
  const factory Item({
    @Default('') String id,
    @Default('') String name,
    Data? data,
    @JsonKey(name: "createdAt") String? createdAt,
    @JsonKey(name: "updatedAt") String? updatedAt,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "color") String? dataColor,
    @JsonKey(name: "capacity") String? dataCapacity,
    @JsonKey(name: "capacity GB") int? capacityGb,
    @JsonKey(name: "price") double? dataPrice,
    @JsonKey(name: "Price") String? price,
    @JsonKey(name: "generation") String? dataGeneration,
    @JsonKey(name: "year") int? year,
    @JsonKey(name: "CPU model") String? cpuModel,
    @JsonKey(name: "Hard disk size") String? hardDiskSize,
    @JsonKey(name: "Strap Colour") String? strapColour,
    @JsonKey(name: "Case Size") String? caseSize,
    @JsonKey(name: "Color") String? color,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Capacity") String? capacity,
    @JsonKey(name: "Screen size") double? screenSize,
    @JsonKey(name: "Generation") String? generation,
  }) = _Data;

  const Data._();

  String? get combinedPrice {
    if (dataPrice != null) {
      return '$dataPrice';
    }
    if (price == null || price!.isEmpty) {
      return "";
    }
    return "$price";
  }

  String? get combinedCapacity {
    if (capacityGb != null) {
      return '$capacityGb GB';
    }
    if (dataCapacity != null) {
      return dataCapacity;
    }
    return super.capacity;
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
