// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_mdl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updatedAt")
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      String name,
      Data? data,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Data? data,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "updatedAt") String? updatedAt});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {this.id = '',
      this.name = '',
      this.data,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "updatedAt") this.updatedAt});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  final Data? data;
  @override
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @override
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, data: $data, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, data, createdAt, updatedAt);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final String id,
      final String name,
      final Data? data,
      @JsonKey(name: "createdAt") final String? createdAt,
      @JsonKey(name: "updatedAt") final String? updatedAt}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Data? get data;
  @override
  @JsonKey(name: "createdAt")
  String? get createdAt;
  @override
  @JsonKey(name: "updatedAt")
  String? get updatedAt;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "color")
  String? get dataColor => throw _privateConstructorUsedError;
  @JsonKey(name: "capacity")
  String? get dataCapacity => throw _privateConstructorUsedError;
  @JsonKey(name: "capacity GB")
  int? get capacityGb => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  double? get dataPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "Price")
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "generation")
  String? get dataGeneration => throw _privateConstructorUsedError;
  @JsonKey(name: "year")
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: "CPU model")
  String? get cpuModel => throw _privateConstructorUsedError;
  @JsonKey(name: "Hard disk size")
  String? get hardDiskSize => throw _privateConstructorUsedError;
  @JsonKey(name: "Strap Colour")
  String? get strapColour => throw _privateConstructorUsedError;
  @JsonKey(name: "Case Size")
  String? get caseSize => throw _privateConstructorUsedError;
  @JsonKey(name: "Color")
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Capacity")
  String? get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: "Screen size")
  double? get screenSize => throw _privateConstructorUsedError;
  @JsonKey(name: "Generation")
  String? get generation => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: "color") String? dataColor,
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
      @JsonKey(name: "Generation") String? generation});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataColor = freezed,
    Object? dataCapacity = freezed,
    Object? capacityGb = freezed,
    Object? dataPrice = freezed,
    Object? price = freezed,
    Object? dataGeneration = freezed,
    Object? year = freezed,
    Object? cpuModel = freezed,
    Object? hardDiskSize = freezed,
    Object? strapColour = freezed,
    Object? caseSize = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? screenSize = freezed,
    Object? generation = freezed,
  }) {
    return _then(_value.copyWith(
      dataColor: freezed == dataColor
          ? _value.dataColor
          : dataColor // ignore: cast_nullable_to_non_nullable
              as String?,
      dataCapacity: freezed == dataCapacity
          ? _value.dataCapacity
          : dataCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      capacityGb: freezed == capacityGb
          ? _value.capacityGb
          : capacityGb // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPrice: freezed == dataPrice
          ? _value.dataPrice
          : dataPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      dataGeneration: freezed == dataGeneration
          ? _value.dataGeneration
          : dataGeneration // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cpuModel: freezed == cpuModel
          ? _value.cpuModel
          : cpuModel // ignore: cast_nullable_to_non_nullable
              as String?,
      hardDiskSize: freezed == hardDiskSize
          ? _value.hardDiskSize
          : hardDiskSize // ignore: cast_nullable_to_non_nullable
              as String?,
      strapColour: freezed == strapColour
          ? _value.strapColour
          : strapColour // ignore: cast_nullable_to_non_nullable
              as String?,
      caseSize: freezed == caseSize
          ? _value.caseSize
          : caseSize // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String?,
      screenSize: freezed == screenSize
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as double?,
      generation: freezed == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "color") String? dataColor,
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
      @JsonKey(name: "Generation") String? generation});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataColor = freezed,
    Object? dataCapacity = freezed,
    Object? capacityGb = freezed,
    Object? dataPrice = freezed,
    Object? price = freezed,
    Object? dataGeneration = freezed,
    Object? year = freezed,
    Object? cpuModel = freezed,
    Object? hardDiskSize = freezed,
    Object? strapColour = freezed,
    Object? caseSize = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? screenSize = freezed,
    Object? generation = freezed,
  }) {
    return _then(_$DataImpl(
      dataColor: freezed == dataColor
          ? _value.dataColor
          : dataColor // ignore: cast_nullable_to_non_nullable
              as String?,
      dataCapacity: freezed == dataCapacity
          ? _value.dataCapacity
          : dataCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      capacityGb: freezed == capacityGb
          ? _value.capacityGb
          : capacityGb // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPrice: freezed == dataPrice
          ? _value.dataPrice
          : dataPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      dataGeneration: freezed == dataGeneration
          ? _value.dataGeneration
          : dataGeneration // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cpuModel: freezed == cpuModel
          ? _value.cpuModel
          : cpuModel // ignore: cast_nullable_to_non_nullable
              as String?,
      hardDiskSize: freezed == hardDiskSize
          ? _value.hardDiskSize
          : hardDiskSize // ignore: cast_nullable_to_non_nullable
              as String?,
      strapColour: freezed == strapColour
          ? _value.strapColour
          : strapColour // ignore: cast_nullable_to_non_nullable
              as String?,
      caseSize: freezed == caseSize
          ? _value.caseSize
          : caseSize // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String?,
      screenSize: freezed == screenSize
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as double?,
      generation: freezed == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl extends _Data {
  const _$DataImpl(
      {@JsonKey(name: "color") this.dataColor,
      @JsonKey(name: "capacity") this.dataCapacity,
      @JsonKey(name: "capacity GB") this.capacityGb,
      @JsonKey(name: "price") this.dataPrice,
      @JsonKey(name: "Price") this.price,
      @JsonKey(name: "generation") this.dataGeneration,
      @JsonKey(name: "year") this.year,
      @JsonKey(name: "CPU model") this.cpuModel,
      @JsonKey(name: "Hard disk size") this.hardDiskSize,
      @JsonKey(name: "Strap Colour") this.strapColour,
      @JsonKey(name: "Case Size") this.caseSize,
      @JsonKey(name: "Color") this.color,
      @JsonKey(name: "Description") this.description,
      @JsonKey(name: "Capacity") this.capacity,
      @JsonKey(name: "Screen size") this.screenSize,
      @JsonKey(name: "Generation") this.generation})
      : super._();

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey(name: "color")
  final String? dataColor;
  @override
  @JsonKey(name: "capacity")
  final String? dataCapacity;
  @override
  @JsonKey(name: "capacity GB")
  final int? capacityGb;
  @override
  @JsonKey(name: "price")
  final double? dataPrice;
  @override
  @JsonKey(name: "Price")
  final String? price;
  @override
  @JsonKey(name: "generation")
  final String? dataGeneration;
  @override
  @JsonKey(name: "year")
  final int? year;
  @override
  @JsonKey(name: "CPU model")
  final String? cpuModel;
  @override
  @JsonKey(name: "Hard disk size")
  final String? hardDiskSize;
  @override
  @JsonKey(name: "Strap Colour")
  final String? strapColour;
  @override
  @JsonKey(name: "Case Size")
  final String? caseSize;
  @override
  @JsonKey(name: "Color")
  final String? color;
  @override
  @JsonKey(name: "Description")
  final String? description;
  @override
  @JsonKey(name: "Capacity")
  final String? capacity;
  @override
  @JsonKey(name: "Screen size")
  final double? screenSize;
  @override
  @JsonKey(name: "Generation")
  final String? generation;

  @override
  String toString() {
    return 'Data(dataColor: $dataColor, dataCapacity: $dataCapacity, capacityGb: $capacityGb, dataPrice: $dataPrice, price: $price, dataGeneration: $dataGeneration, year: $year, cpuModel: $cpuModel, hardDiskSize: $hardDiskSize, strapColour: $strapColour, caseSize: $caseSize, color: $color, description: $description, capacity: $capacity, screenSize: $screenSize, generation: $generation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.dataColor, dataColor) ||
                other.dataColor == dataColor) &&
            (identical(other.dataCapacity, dataCapacity) ||
                other.dataCapacity == dataCapacity) &&
            (identical(other.capacityGb, capacityGb) ||
                other.capacityGb == capacityGb) &&
            (identical(other.dataPrice, dataPrice) ||
                other.dataPrice == dataPrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.dataGeneration, dataGeneration) ||
                other.dataGeneration == dataGeneration) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.cpuModel, cpuModel) ||
                other.cpuModel == cpuModel) &&
            (identical(other.hardDiskSize, hardDiskSize) ||
                other.hardDiskSize == hardDiskSize) &&
            (identical(other.strapColour, strapColour) ||
                other.strapColour == strapColour) &&
            (identical(other.caseSize, caseSize) ||
                other.caseSize == caseSize) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.screenSize, screenSize) ||
                other.screenSize == screenSize) &&
            (identical(other.generation, generation) ||
                other.generation == generation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dataColor,
      dataCapacity,
      capacityGb,
      dataPrice,
      price,
      dataGeneration,
      year,
      cpuModel,
      hardDiskSize,
      strapColour,
      caseSize,
      color,
      description,
      capacity,
      screenSize,
      generation);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data extends Data {
  const factory _Data(
      {@JsonKey(name: "color") final String? dataColor,
      @JsonKey(name: "capacity") final String? dataCapacity,
      @JsonKey(name: "capacity GB") final int? capacityGb,
      @JsonKey(name: "price") final double? dataPrice,
      @JsonKey(name: "Price") final String? price,
      @JsonKey(name: "generation") final String? dataGeneration,
      @JsonKey(name: "year") final int? year,
      @JsonKey(name: "CPU model") final String? cpuModel,
      @JsonKey(name: "Hard disk size") final String? hardDiskSize,
      @JsonKey(name: "Strap Colour") final String? strapColour,
      @JsonKey(name: "Case Size") final String? caseSize,
      @JsonKey(name: "Color") final String? color,
      @JsonKey(name: "Description") final String? description,
      @JsonKey(name: "Capacity") final String? capacity,
      @JsonKey(name: "Screen size") final double? screenSize,
      @JsonKey(name: "Generation") final String? generation}) = _$DataImpl;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  @JsonKey(name: "color")
  String? get dataColor;
  @override
  @JsonKey(name: "capacity")
  String? get dataCapacity;
  @override
  @JsonKey(name: "capacity GB")
  int? get capacityGb;
  @override
  @JsonKey(name: "price")
  double? get dataPrice;
  @override
  @JsonKey(name: "Price")
  String? get price;
  @override
  @JsonKey(name: "generation")
  String? get dataGeneration;
  @override
  @JsonKey(name: "year")
  int? get year;
  @override
  @JsonKey(name: "CPU model")
  String? get cpuModel;
  @override
  @JsonKey(name: "Hard disk size")
  String? get hardDiskSize;
  @override
  @JsonKey(name: "Strap Colour")
  String? get strapColour;
  @override
  @JsonKey(name: "Case Size")
  String? get caseSize;
  @override
  @JsonKey(name: "Color")
  String? get color;
  @override
  @JsonKey(name: "Description")
  String? get description;
  @override
  @JsonKey(name: "Capacity")
  String? get capacity;
  @override
  @JsonKey(name: "Screen size")
  double? get screenSize;
  @override
  @JsonKey(name: "Generation")
  String? get generation;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
