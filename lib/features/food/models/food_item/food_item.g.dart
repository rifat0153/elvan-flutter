// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodItem _$$_FoodItemFromJson(Map<String, dynamic> json) => _$_FoodItem(
      id: json['id'] as String?,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      category: json['category'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allergens: (json['allergens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt:
          TimestampConverter.timestampFromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_FoodItemToJson(_$_FoodItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'discount': instance.discount,
      'category': instance.category,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients,
      'allergens': instance.allergens,
      'createdAt': TimestampConverter.timestampToJson(instance.createdAt),
    };
