import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/core/models/food/food_item.dart';

abstract class IFoodRemoteDataSource {
  Stream<List<FoodItem>> getFoodsStream();
}

class FoodRemoteDataSource implements IFoodRemoteDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Stream<List<FoodItem>> getFoodsStream() async* {
    StreamController<List<FoodItem>> streamController = StreamController();

    final docsRef = db.collection("foodItems").withConverter(
          fromFirestore: (snapshot, _) => FoodItem.fromJson(snapshot.data()!),
          toFirestore: (foodItem, _) => foodItem.toJson(),
        );

    docsRef.snapshots().listen(
          (event) {
            final foodItems = event.docs.map((e) => e.data()).toList();

            print('foodItems: $foodItems');
            streamController.add(foodItems);
          },
          onError: (error) => print("Listen failed: $error"),
          onDone: () {
            print("Listen done");
            streamController.close();
          },
        );

    yield* streamController.stream;
  }
}
