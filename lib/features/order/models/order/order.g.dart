// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      userId: json['userId'] as String,
      foodItems: (json['foodItems'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      subTotal: (json['subTotal'] as num).toDouble(),
      status: OrderStatus.fromJson(json['status'] as String),
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      instructions: (json['instructions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt:
          TimestampConverter.timestampFromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'foodItems': instance.foodItems.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'discount': instance.discount,
      'subTotal': instance.subTotal,
      'status': OrderStatus.toJson(instance.status),
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
      'instructions': instance.instructions,
      'createdAt': TimestampConverter.timestampToJson(instance.createdAt),
    };
