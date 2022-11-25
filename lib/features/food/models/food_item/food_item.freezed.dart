// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return _FoodItem.fromJson(json);
}

/// @nodoc
mixin _$FoodItem {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res, FoodItem>;
  @useResult
  $Res call(
      {String? id,
      String title,
      double price,
      String? category,
      String? description,
      List<String> ingredients,
      List<String> allergens,
      double? discount,
      String? imageUrl});
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res, $Val extends FoodItem>
    implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? price = null,
    Object? category = freezed,
    Object? description = freezed,
    Object? ingredients = null,
    Object? allergens = null,
    Object? discount = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodItemCopyWith<$Res> implements $FoodItemCopyWith<$Res> {
  factory _$$_FoodItemCopyWith(
          _$_FoodItem value, $Res Function(_$_FoodItem) then) =
      __$$_FoodItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      double price,
      String? category,
      String? description,
      List<String> ingredients,
      List<String> allergens,
      double? discount,
      String? imageUrl});
}

/// @nodoc
class __$$_FoodItemCopyWithImpl<$Res>
    extends _$FoodItemCopyWithImpl<$Res, _$_FoodItem>
    implements _$$_FoodItemCopyWith<$Res> {
  __$$_FoodItemCopyWithImpl(
      _$_FoodItem _value, $Res Function(_$_FoodItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? price = null,
    Object? category = freezed,
    Object? description = freezed,
    Object? ingredients = null,
    Object? allergens = null,
    Object? discount = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_FoodItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FoodItem implements _FoodItem {
  const _$_FoodItem(
      {this.id,
      required this.title,
      required this.price,
      this.category,
      this.description,
      final List<String> ingredients = const [],
      final List<String> allergens = const [],
      this.discount,
      this.imageUrl})
      : _ingredients = ingredients,
        _allergens = allergens;

  factory _$_FoodItem.fromJson(Map<String, dynamic> json) =>
      _$$_FoodItemFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String? category;
  @override
  final String? description;
  final List<String> _ingredients;
  @override
  @JsonKey()
  List<String> get ingredients {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _allergens;
  @override
  @JsonKey()
  List<String> get allergens {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  @override
  final double? discount;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'FoodItem(id: $id, title: $title, price: $price, category: $category, description: $description, ingredients: $ingredients, allergens: $allergens, discount: $discount, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      price,
      category,
      description,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_allergens),
      discount,
      imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodItemCopyWith<_$_FoodItem> get copyWith =>
      __$$_FoodItemCopyWithImpl<_$_FoodItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodItemToJson(
      this,
    );
  }
}

abstract class _FoodItem implements FoodItem {
  const factory _FoodItem(
      {final String? id,
      required final String title,
      required final double price,
      final String? category,
      final String? description,
      final List<String> ingredients,
      final List<String> allergens,
      final double? discount,
      final String? imageUrl}) = _$_FoodItem;

  factory _FoodItem.fromJson(Map<String, dynamic> json) = _$_FoodItem.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  double get price;
  @override
  String? get category;
  @override
  String? get description;
  @override
  List<String> get ingredients;
  @override
  List<String> get allergens;
  @override
  double? get discount;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_FoodItemCopyWith<_$_FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}
