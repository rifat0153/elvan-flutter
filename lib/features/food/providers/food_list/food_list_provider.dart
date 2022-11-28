import 'package:elvan/features/food/constants/constant.dart';
import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:elvan/shared/providers/firebase/firebase_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

// final foodListProvider = StreamProvider.autoDispose<List<FoodItem>>((ref) {
//   return ref
//       .watch(firebaseFirestoreProvider)
//       .collection(
//         Constants.foodItemsCollection,
//       )
//       .snapshots()
//       .map(
//         (snapshot) => snapshot.docs
//             .map(
//               (doc) => FoodItem.fromJson(doc.data()),
//             )
//             .toList(),
//       );
// });
