import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/extensions/timestamp/timestamp_json_converter.dart';
import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  @JsonSerializable(explicitToJson: true)
  const factory Order({
    required String id,
    required String userId,
    required List<FoodItem> foodItems,
    required String status,
    required double total,
    required double discount,
    required double subTotal,
    @Default([])
        List<String> instructions,
    String? paymentMethod,
    String? paymentStatus,
    @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson,
    )
        Timestamp? createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
