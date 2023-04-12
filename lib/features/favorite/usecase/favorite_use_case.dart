import 'dart:convert';

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
      return jsonEncode(e.toJson());
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
      return FoodItem.fromJson(jsonDecode(e));
    }).toList();
  }

  List<FoodItem> removeFavorite(FoodItem foodItem, List<FoodItem> foodList,
      {bool save = true}) {
    foodList.removeWhere((element) => element.id == foodItem.id);

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
}
