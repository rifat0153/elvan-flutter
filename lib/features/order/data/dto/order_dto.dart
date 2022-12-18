import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/features/order/data/dto/food_item_customized_dto.dart';
import 'package:elvan/features/order/data/dto/order_status_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

@freezed
class OrderDto with _$OrderDto {
  @JsonSerializable(explicitToJson: true)
  const factory OrderDto({
    required String id,
    required String userId,
    required List<FoodItemCustomizedDto> foodItems,
    required double total,
    required double discount,
    required double subTotal,
    @JsonKey(
      fromJson: OrderStatusDto.fromJson,
      toJson: OrderStatusDto.toJson,
    )
        required OrderStatusDto status,
    String? paymentMethod,
    String? paymentStatus,
    @Default([])
        List<String> instructions,
    @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson,
    )
        Timestamp? createdAt,
  }) = _Order;

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);
}
