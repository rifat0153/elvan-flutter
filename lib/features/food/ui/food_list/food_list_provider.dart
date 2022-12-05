import 'package:elvan/features/food/constants/constant.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/shared/providers/firebase/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_list_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<FoodItem>> foodList(FoodListRef ref) async {
  final list = await ref
      .watch(firebaseFirestoreProvider)
      .collection(
        Constants.foodItemsCollection,
      )
      .get();

  return list.docs
      .map(
        (e) => FoodItem.fromJson(e.data()),
      )
      .toList();
}
