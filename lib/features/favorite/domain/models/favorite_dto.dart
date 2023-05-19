import 'package:elvan_shared/domain_models/index.dart';
import 'package:elvan_shared/dtos/category/build_step/build_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_dto.freezed.dart';
part 'favorite_dto.g.dart';

@freezed
class FavoriteDto with _$FavoriteDto {
  const factory FavoriteDto({
    String? id,
    required String title,
    required double price,
    required String categoryId,
    required String categoryTitle,
    double? discount,
    @Default(false) bool isTopPick,
    String? description,
    String? imageUrl,
    @Default(false) bool isFavorite,
    @Default(0) int quantity,
    @Default([]) List<String> tags,
    @Default([]) List<String> ingredients,
    @Default([]) List<BuildStep> buildStepsOverrides,
    @Default([]) List<String> allergens,
    int? timeToPrepareInMinutes,
    @Default(false) bool isAvailable,
    String? createdAt,
  }) = _FavoriteDto;

  factory FavoriteDto.fromJson(Map<String, dynamic> json) => _$FavoriteDtoFromJson(json);

  factory FavoriteDto.formFoodItem(FoodItem item) {
    return FavoriteDto(
      title: item.title,
      price: item.price,
      categoryId: item.categoryId,
      categoryTitle: item.categoryTitle,
      allergens: item.allergens,
      buildStepsOverrides: item.buildStepsOverrides,
      createdAt: item.createdAt?.toDate().toString(),
      description: item.description,
      discount: item.discount,
      id: item.id,
      imageUrl: item.imageUrl,
      ingredients: item.ingredients,
      isAvailable: item.isAvailable,
      isFavorite: item.isFavorite,
      isTopPick: item.isTopPick,
      quantity: item.quantity,
      tags: item.tags,
      timeToPrepareInMinutes: item.timeToPrepareInMinutes,
    );
  }
}
