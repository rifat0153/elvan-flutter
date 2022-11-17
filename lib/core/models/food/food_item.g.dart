// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodItem _$$_FoodItemFromJson(Map<String, dynamic> json) => _$_FoodItem(
      id: json['id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_FoodItemToJson(_$_FoodItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'imageUrl': instance.imageUrl,
    };
