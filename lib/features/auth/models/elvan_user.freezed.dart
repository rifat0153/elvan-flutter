// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'elvan_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElvanUser _$ElvanUserFromJson(Map<String, dynamic> json) {
  return _ElvanUser.fromJson(json);
}

/// @nodoc
mixin _$ElvanUser {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  int get totalOrders => throw _privateConstructorUsedError;
  int get totalOrdersCancelled => throw _privateConstructorUsedError;
  int get totalOrdersDelivered => throw _privateConstructorUsedError;
  int get totalOrdersPending => throw _privateConstructorUsedError;
  int get totalOrdersRejected => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson)
  Timestamp? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElvanUserCopyWith<ElvanUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElvanUserCopyWith<$Res> {
  factory $ElvanUserCopyWith(ElvanUser value, $Res Function(ElvanUser) then) =
      _$ElvanUserCopyWithImpl<$Res, ElvanUser>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? imageUrl,
      String? phone,
      String? address,
      String? role,
      double totalSpent,
      int totalOrders,
      int totalOrdersCancelled,
      int totalOrdersDelivered,
      int totalOrdersPending,
      int totalOrdersRejected,
      @JsonKey(fromJson: TimestampConverter.timestampFromJson, toJson: TimestampConverter.timestampToJson)
          Timestamp? createdAt});
}

/// @nodoc
class _$ElvanUserCopyWithImpl<$Res, $Val extends ElvanUser>
    implements $ElvanUserCopyWith<$Res> {
  _$ElvanUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? role = freezed,
    Object? totalSpent = null,
    Object? totalOrders = null,
    Object? totalOrdersCancelled = null,
    Object? totalOrdersDelivered = null,
    Object? totalOrdersPending = null,
    Object? totalOrdersRejected = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersCancelled: null == totalOrdersCancelled
          ? _value.totalOrdersCancelled
          : totalOrdersCancelled // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersDelivered: null == totalOrdersDelivered
          ? _value.totalOrdersDelivered
          : totalOrdersDelivered // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersPending: null == totalOrdersPending
          ? _value.totalOrdersPending
          : totalOrdersPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersRejected: null == totalOrdersRejected
          ? _value.totalOrdersRejected
          : totalOrdersRejected // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElvanUserCopyWith<$Res> implements $ElvanUserCopyWith<$Res> {
  factory _$$_ElvanUserCopyWith(
          _$_ElvanUser value, $Res Function(_$_ElvanUser) then) =
      __$$_ElvanUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? imageUrl,
      String? phone,
      String? address,
      String? role,
      double totalSpent,
      int totalOrders,
      int totalOrdersCancelled,
      int totalOrdersDelivered,
      int totalOrdersPending,
      int totalOrdersRejected,
      @JsonKey(fromJson: TimestampConverter.timestampFromJson, toJson: TimestampConverter.timestampToJson)
          Timestamp? createdAt});
}

/// @nodoc
class __$$_ElvanUserCopyWithImpl<$Res>
    extends _$ElvanUserCopyWithImpl<$Res, _$_ElvanUser>
    implements _$$_ElvanUserCopyWith<$Res> {
  __$$_ElvanUserCopyWithImpl(
      _$_ElvanUser _value, $Res Function(_$_ElvanUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? role = freezed,
    Object? totalSpent = null,
    Object? totalOrders = null,
    Object? totalOrdersCancelled = null,
    Object? totalOrdersDelivered = null,
    Object? totalOrdersPending = null,
    Object? totalOrdersRejected = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ElvanUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      totalOrders: null == totalOrders
          ? _value.totalOrders
          : totalOrders // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersCancelled: null == totalOrdersCancelled
          ? _value.totalOrdersCancelled
          : totalOrdersCancelled // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersDelivered: null == totalOrdersDelivered
          ? _value.totalOrdersDelivered
          : totalOrdersDelivered // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersPending: null == totalOrdersPending
          ? _value.totalOrdersPending
          : totalOrdersPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalOrdersRejected: null == totalOrdersRejected
          ? _value.totalOrdersRejected
          : totalOrdersRejected // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElvanUser implements _ElvanUser {
  const _$_ElvanUser(
      {this.id,
      this.name,
      this.email,
      this.imageUrl,
      this.phone,
      this.address,
      this.role,
      this.totalSpent = 0,
      this.totalOrders = 0,
      this.totalOrdersCancelled = 0,
      this.totalOrdersDelivered = 0,
      this.totalOrdersPending = 0,
      this.totalOrdersRejected = 0,
      @JsonKey(fromJson: TimestampConverter.timestampFromJson, toJson: TimestampConverter.timestampToJson)
          this.createdAt});

  factory _$_ElvanUser.fromJson(Map<String, dynamic> json) =>
      _$$_ElvanUserFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? imageUrl;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? role;
  @override
  @JsonKey()
  final double totalSpent;
  @override
  @JsonKey()
  final int totalOrders;
  @override
  @JsonKey()
  final int totalOrdersCancelled;
  @override
  @JsonKey()
  final int totalOrdersDelivered;
  @override
  @JsonKey()
  final int totalOrdersPending;
  @override
  @JsonKey()
  final int totalOrdersRejected;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson)
  final Timestamp? createdAt;

  @override
  String toString() {
    return 'ElvanUser(id: $id, name: $name, email: $email, imageUrl: $imageUrl, phone: $phone, address: $address, role: $role, totalSpent: $totalSpent, totalOrders: $totalOrders, totalOrdersCancelled: $totalOrdersCancelled, totalOrdersDelivered: $totalOrdersDelivered, totalOrdersPending: $totalOrdersPending, totalOrdersRejected: $totalOrdersRejected, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElvanUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalOrdersCancelled, totalOrdersCancelled) ||
                other.totalOrdersCancelled == totalOrdersCancelled) &&
            (identical(other.totalOrdersDelivered, totalOrdersDelivered) ||
                other.totalOrdersDelivered == totalOrdersDelivered) &&
            (identical(other.totalOrdersPending, totalOrdersPending) ||
                other.totalOrdersPending == totalOrdersPending) &&
            (identical(other.totalOrdersRejected, totalOrdersRejected) ||
                other.totalOrdersRejected == totalOrdersRejected) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      imageUrl,
      phone,
      address,
      role,
      totalSpent,
      totalOrders,
      totalOrdersCancelled,
      totalOrdersDelivered,
      totalOrdersPending,
      totalOrdersRejected,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElvanUserCopyWith<_$_ElvanUser> get copyWith =>
      __$$_ElvanUserCopyWithImpl<_$_ElvanUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElvanUserToJson(
      this,
    );
  }
}

abstract class _ElvanUser implements ElvanUser {
  const factory _ElvanUser(
      {final String? id,
      final String? name,
      final String? email,
      final String? imageUrl,
      final String? phone,
      final String? address,
      final String? role,
      final double totalSpent,
      final int totalOrders,
      final int totalOrdersCancelled,
      final int totalOrdersDelivered,
      final int totalOrdersPending,
      final int totalOrdersRejected,
      @JsonKey(fromJson: TimestampConverter.timestampFromJson, toJson: TimestampConverter.timestampToJson)
          final Timestamp? createdAt}) = _$_ElvanUser;

  factory _ElvanUser.fromJson(Map<String, dynamic> json) =
      _$_ElvanUser.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get imageUrl;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  String? get role;
  @override
  double get totalSpent;
  @override
  int get totalOrders;
  @override
  int get totalOrdersCancelled;
  @override
  int get totalOrdersDelivered;
  @override
  int get totalOrdersPending;
  @override
  int get totalOrdersRejected;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson)
  Timestamp? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ElvanUserCopyWith<_$_ElvanUser> get copyWith =>
      throw _privateConstructorUsedError;
}
