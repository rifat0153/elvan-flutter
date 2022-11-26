import 'dart:async';

import 'package:elvan/features/food/repository/food_repository.dart';
import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_provider.g.dart';

@Riverpod()
FoodRepository foodDataSource(FoodDataSourceRef ref) => FoodRemoteDataSource();

final provider = Provider(((ref) => FoodRemoteDataSource()));

@riverpod
class FoodListFuture extends _$FoodListFuture {
  @override
  FutureOr<List<FoodItem>> build() {
    return Future.delayed(const Duration(seconds: 2), () async {
      final foodList = [
        const FoodItem(
          title: 'Food 1',
          description: 'Food 1 Description',
          price: 1.0,
        ),
        const FoodItem(
          title: 'Food 2',
          description: 'Food 2 Description',
          price: 2.0,
        ),
      ];
      return foodList;
    });
  }
}

// State Notifier with Codegen
@riverpod
class FoodListNotifier2 extends _$FoodListNotifier2 {
  @override
  List<FoodItem> build() {
    final foodApi = ref.watch(foodDataSourceProvider);

    return [];
  }

  Future<void> getFoods() async {
    state = const [
      FoodItem(
        id: '1',
        title: 'Food 1',
        description: 'Food 1 description',
        price: 1.0,
        imageUrl: 'https://picsum.photos/200/300',
      )
    ];
  }
}

@Riverpod()
foodItemStream(FoodItemStreamRef ref) {
  return ref.watch(foodDataSourceProvider).getFoodsStream();
}

// @Riverpod()
// Stream<List<FoodItem>> foodItemStream(FoodItemStreamRef ref) async* {
//   final StreamController<List<FoodItem>> streamController = StreamController<List<FoodItem>>();

//   streamController.addStream(ref.watch(foodDataSourceProvider).getFoodsStream());

//   ref.onDispose(() {
//     streamController.close();
//   });

//   yield* streamController.stream;
// }

final foodItemStreamOld = StreamProvider.autoDispose((ref) {
  return ref.watch(foodDataSourceProvider).getFoodsStream();
});
