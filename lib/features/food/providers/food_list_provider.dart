import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final foodListProvider = StreamProvider.autoDispose<List<FoodItem>>((ref) {
  return FirebaseFirestore.instance.collection('foodItems').snapshots().map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => FoodItem.fromJson(doc.data()),
            )
            .toList(),
      );
});
