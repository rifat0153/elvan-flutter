import 'dart:convert';

import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteProvider, List<FoodItem>>(
        (ref) => FavoriteProvider());

class FavoriteProvider extends StateNotifier<List<FoodItem>> {
  FavoriteProvider() : super([]) {
    loadFavorite();
  }

  void addFavorite(FoodItem? foodItem) {
    if (foodItem == null) return;

    var temp = state;
    state = [...temp, foodItem];
    saveFavorite();
  }

  //save to local storage
  void saveFavorite() {
    var list = state.map((e) {
      return jsonEncode(e.toJson());
    }).toList();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setStringList('favorite', list);
    });
  }

  //load from local storage
  void loadFavorite() {
    SharedPreferences.getInstance().then((prefs) {
      var list = prefs.getStringList('favorite');
      if (list != null) {
        state = list.map((e) => FoodItem.fromJson(jsonDecode(e))).toList();
      }
    });
  }

  void removeFavorite(FoodItem? foodItem) {
    if (foodItem == null) return;

    var temp = state;

    temp.removeWhere((element) => element.id == foodItem.id);
    state = [...temp];
    saveFavorite();
  }

  bool isFavorite(FoodItem? foodItem) {
    if (foodItem == null) return false;
    return state.any((element) => element.id == foodItem.id);
  }
}
