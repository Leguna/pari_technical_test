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
    @JsonKey(name: "Price") String? price,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
