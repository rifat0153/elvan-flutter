import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan_shared/dtos/food/food_item_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/firebase/firebase_providers.dart';
import 'package:elvan/features/food/constants/constant.dart';
import 'package:elvan/features/food/data/dto/food_item_dto.dart';
import 'package:elvan/features/food/domain/repository/food_repository.dart';

final foodRepositoryProvider = Provider<FoodRepository>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);

  return FoodRepositoryImpl(firebaseFirestore: firestore);
});

class FoodRepositoryImpl implements FoodRepository {
  final FirebaseFirestore firebaseFirestore;

  const FoodRepositoryImpl({
    required this.firebaseFirestore,
  });

  @override
  Stream<List<FoodItemDto>> getFoodsStream() {
    return firebaseFirestore
        .collection(Constants.foodItemsCollection)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              FoodItemDto.fromJson(snapshot.data()!),
          toFirestore: (foodItemDto, _) => foodItemDto.toJson(),
        )
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => e.data(),
              )
              .toList(),
        );
  }

  @override
  Future<List<FoodItemDto>> getFoodList() {
    return firebaseFirestore
        .collection(Constants.foodItemsCollection)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              FoodItemDto.fromJson(snapshot.data()!),
          toFirestore: (foodItemDto, _) => foodItemDto.toJson(),
        )
        .get()
        .then(
          (value) => value.docs.map((e) => e.data()).toList(),
        );
  }

  @override
  Future<List<FoodItemDto>> getTopPicks() {
    return firebaseFirestore
        .collection(Constants.foodItemsCollection)
        .where('isTopPick', isEqualTo: true)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              FoodItemDto.fromJson(snapshot.data()!),
          toFirestore: (foodItemDto, _) => foodItemDto.toJson(),
        )
        .get()
        .then(
          (value) => value.docs.map((e) => e.data()).toList(),
        );
  }
}
