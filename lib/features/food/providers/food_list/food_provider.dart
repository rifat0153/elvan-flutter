import 'package:elvan/features/food/repository/food_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_provider.g.dart';

@Riverpod()
FoodRepository foodDataSource(FoodDataSourceRef ref) => FoodRemoteDataSource();

final foodItemStreamOld = StreamProvider.autoDispose((ref) {
  return ref.watch(foodDataSourceProvider).getFoodsStream();
});
