import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/features/favorite/domain/models/favorite_dto.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoriteUseCaseProvider = Provider((ref) => FavoriteUseCase());

class FavoriteUseCase {
  List<FoodItem> addFavorite(FoodItem foodItem, List<FoodItem> foodList,
      {bool save = true}) {
    var state = [...foodList, foodItem];

    return state;
  }

  //save to local storage
  void saveFavoriteToLocal(
    List<FoodItem> state,
  ) {
    var list = state.map((e) {
      final dto = FavoriteDto.formFoodItem(e);
      return jsonEncode(dto.toJson());
    }).toList();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setStringList('favorite', list);
    });
  }

  //load from local storage
  Future<List<FoodItem>> getFavoriteFromLocal() async {
    var sp = await SharedPreferences.getInstance();
    var list = sp.getStringList('favorite');
    if (list == null) return [];
    return list.map((e) {
      final favorite = FavoriteDto.fromJson(jsonDecode(e));
      return toFoodItem(favorite);
    }).toList();
  }

  List<FoodItem> removeFavorite(FoodItem foodItem, List<FoodItem> foodList,
      {bool save = true}) {
    foodList.removeWhere((element) => element.id == foodItem.id);
    saveFavoriteToLocal(foodList);
    return [...foodList];
  }

  bool isFavorite(FoodItem foodItem, List<FoodItem> foodList) {
    return foodList.any((element) => element.id == foodItem.id);
  }

  // void toggle(FoodItem foodItem) {
  //   if (isFavorite(foodItem)) {
  //     removeFavorite(foodItem);
  //   } else {
  //     addFavorite(foodItem);
  //   }
  // }

  FoodItem toFoodItem(FavoriteDto dto) {
    return FoodItem(
      title: dto.title,
      price: dto.price,
      categoryId: dto.categoryId,
      categoryTitle: dto.categoryTitle,
      allergens: dto.allergens,
      buildStepsOverrides: dto.buildStepsOverrides,
      createdAt: Timestamp.fromDate(
          DateTime.parse(dto.createdAt ?? DateTime.now().toString())),
      description: dto.description,
      discount: dto.discount,
      id: dto.id,
      imageUrl: dto.imageUrl,
      ingredients: dto.ingredients,
      isAvailable: dto.isAvailable,
      isFavorite: dto.isFavorite,
      isTopPick: dto.isTopPick,
      quantity: dto.quantity,
      tags: dto.tags,
      timeToPrepareInMinutes: dto.timeToPrepareInMinutes,
    );
  }
}
