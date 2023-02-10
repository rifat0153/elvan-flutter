import 'package:elvan_shared/domain_models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteProvider = Provider((ref) => FavoriteProvider());

class FavoriteProvider {
  List<FoodItem> favoriteList = [];

  void addFavorite(FoodItem? foodItem) {
    if (foodItem == null) return;

    favoriteList.add(foodItem);
  }

  void removeFavorite(FoodItem? foodItem) {
    if (foodItem == null) return;

    favoriteList.remove(foodItem);
  }

  bool isFavorite(FoodItem? foodItem) {
    if (foodItem == null) return false;

    return favoriteList.contains(foodItem);
  }
}
