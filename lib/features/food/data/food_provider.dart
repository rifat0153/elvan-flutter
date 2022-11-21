import 'dart:async';

import 'package:elvan/core/models/food/food_item.dart';
import 'package:elvan/features/food/api/food_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_provider.g.dart';

@Riverpod()
FoodDataSource foodDataSource(FoodDataSourceRef ref) => FoodRemoteDataSource();

final provider = Provider(((ref) => FoodRemoteDataSource()));

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

//  State notifier
class FoodListNotifier extends StateNotifier<List<FoodItem>> {
  final FoodDataSource foodDataSource;
  FoodListNotifier(this.foodDataSource) : super([]);

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

    final foodItem = state[0];

    state = [foodItem.copyWith(price: 10)];
  }
}

final foodListProvider = StateNotifierProvider.autoDispose.family<FoodListNotifier, List<FoodItem>, int>((
  ref,
  page,
) {
  final foodApi = ref.watch(foodDataSourceProvider);

  return FoodListNotifier(
    foodApi,
  );
});

@riverpod
FoodDataSource food2DataSournce(Food2DataSournceRef ref) {
  return FoodRemoteDataSource();
}

@Riverpod()
Stream<List<FoodItem>> foodItemStream(FoodItemStreamRef ref) async* {
  final StreamController<List<FoodItem>> streamController = StreamController<List<FoodItem>>();

  streamController.addStream(ref.watch(foodDataSourceProvider).getFoodsStream());

  yield* streamController.stream;
}

final foodItemStreamOld = StreamProvider.autoDispose((ref) {
  return ref.watch(foodDataSourceProvider).getFoodsStream();
});

// @riverpod
// List<FoodItem> foodItemList(FoodItemListRef ref) {
//   final foodItems = ref.watch(foodItemStreamProvider);

//   List<FoodItem> foodItemsList = [];

//   // foodItems.forEach((element) {
//   //   foodItemsList.addAll(element);
//   // });
//   final listener = foodItems.listen((event) {
//     foodItemsList = event;

//     log('Event $event');
//   });
//   ref.onDispose(() {
//     listener.cancel();
//   });

//   return foodItemsList;
// }
