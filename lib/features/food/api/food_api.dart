import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/features/food/models/food_item/food_item.dart';

abstract class FoodDataSource {
  // Stream<FoodItem> getFoodsStream();
  Stream<List<FoodItem>> getFoodsStream();
}

class FoodRemoteDataSource implements FoodDataSource {
  final db = FirebaseFirestore.instance;

  Stream<int> str() async* {
    // The keyword `async*` means a "generator function" that generates a stream
    List<int> a = [1, 2, 3, 4, 5];
    for (var e in a) {
      if (e > 2) yield e;
    }
  }

  @override
  Stream<List<FoodItem>> getFoodsStream() {

    final docsRef = db.collection("foodItems").withConverter(
          fromFirestore: (snapshot, _) => FoodItem.fromJson(snapshot.data()!),
          toFirestore: (foodItem, _) => foodItem.toJson(),
        );

   return docsRef.snapshots().map((event) => event.docs.map((e) => e.data()).toList());

  }

  // @override
  // Stream<List<FoodItem>> getFoodsStream() async* {
  //   StreamController<List<FoodItem>> streamController = StreamController();

  //   final docsRef = db.collection("foodItems").withConverter(
  //         fromFirestore: (snapshot, _) => FoodItem.fromJson(snapshot.data()!),
  //         toFirestore: (foodItem, _) => foodItem.toJson(),
  //       );

  //   docsRef.snapshots().listen(
  //         (event) {
  //           final foodItems = event.docs.map((e) => e.data()).toList();

  //           streamController.add(foodItems);
  //         },
  //         onError: (error) => print("Listen failed: $error"),
  //         onDone: () {
  //           print("Listen done");
  //           streamController.close();
  //         },
  //       );

  //   yield* streamController.stream;
  // }
}
