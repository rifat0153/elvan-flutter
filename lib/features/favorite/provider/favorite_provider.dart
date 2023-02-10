import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteProvider, List<FoodItem>>(
        (ref) => FavoriteProvider());

class FavoriteProvider extends StateNotifier<List<FoodItem>> {
  FavoriteProvider() : super([]);

  void addFavorite(FoodItem? foodItem) {
    if (foodItem == null) return;

    var temp = state;
    state = [...temp, foodItem];
  }

  void removeFavorite(FoodItem? foodItem) {
    if (foodItem == null) return;

    var temp = state;

    temp.removeWhere((element) => element.id == foodItem.id);
    state = [...temp];
  }

  bool isFavorite(FoodItem? foodItem) {
    if (foodItem == null) return false;

    return state.contains(foodItem);
  }
}
