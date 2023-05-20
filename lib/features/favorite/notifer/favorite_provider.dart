import 'package:elvan/features/favorite/usecase/favorite_use_case.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteProvider = NotifierProvider<FavoriteProvider, List<FoodItem>>(FavoriteProvider.new);

class FavoriteProvider extends Notifier<List<FoodItem>> {
  FavoriteUseCase favoriteUseCase = FavoriteUseCase();

  @override
  List<FoodItem> build() {
    loadFavorite();
    return [];
  }

  void addFavorite(FoodItem? foodItem) {
    state = favoriteUseCase.addFavorite(foodItem!, state);
    saveFavorite();
  }

  //save to local storage
  void saveFavorite() {
    favoriteUseCase.saveFavoriteToLocal(state);
  }

  //load from local storage
  void loadFavorite() async {
    state = await favoriteUseCase.getFavoriteFromLocal();
  }

  void removeFavorite(FoodItem? foodItem) {
    state = favoriteUseCase.removeFavorite(foodItem!, state);
  }

  bool isFavorite(FoodItem? foodItem) {
    if (foodItem == null) return false;
    return state.any((element) => element.id == foodItem.id);
  }

  void toggle(FoodItem foodItem) {
    if (isFavorite(foodItem)) {
      removeFavorite(foodItem);
    } else {
      addFavorite(foodItem);
    }
  }
}
