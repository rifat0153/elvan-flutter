import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_on.freezed.dart';
part 'add_on.g.dart';

@freezed
class AddOn with _$AddOn {
  const factory AddOn({
    required String title,
    required double price,
    String? imageUrl,
    @Default(1) int quantity,
  }) = _AddOn;

  factory AddOn.fromJson(Map<String, dynamic> json) => _$AddOnFromJson(json);
}
