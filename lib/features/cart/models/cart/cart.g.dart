// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      userId: json['userId'] as String,
      foodItems: (json['foodItems'] as List<dynamic>?)
              ?.map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: (json['total'] as num).toDouble(),
      subTotal: (json['subTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'userId': instance.userId,
      'foodItems': instance.foodItems.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'subTotal': instance.subTotal,
    };
