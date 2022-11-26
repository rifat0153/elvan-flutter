import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/features/food/models/food_item/food_item.dart';

abstract class FoodRepository {
  // Stream<FoodItem> getFoodsStream();
  Stream<List<FoodItem>> getFoodsStream();
}

class FoodRemoteDataSource implements FoodRepository {
  final db = FirebaseFirestore.instance;

  @override
  Stream<List<FoodItem>> getFoodsStream() {
    final docsRef = db.collection("foodItems").withConverter(
          fromFirestore: (snapshot, _) => FoodItem.fromJson(snapshot.data()!),
          toFirestore: (foodItem, _) => foodItem.toJson(),
        );

    return docsRef.snapshots().map((event) => event.docs.map((e) => e.data()).toList());
  }
}
