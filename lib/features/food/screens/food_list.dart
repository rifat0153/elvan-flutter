import 'package:elvan/core/models/food/food_item.dart';
import 'package:elvan/features/food/data/food_provider.dart';
import 'package:elvan/features/food/screens/food_detail.dart';
import 'package:elvan/navigation/food_navigator.dart';
import 'package:elvan/features/food/api/food_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodListScreen extends ConsumerStatefulWidget {
  const FoodListScreen({super.key});

  @override
  ConsumerState<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends ConsumerState<FoodListScreen> {
  _onTap(BuildContext context) {
    final foodNavigatorKey = ref.read(foodNavigatorKeyProvider);

    // foodNavigatorKey.currentState?.pushNamed(routeFoodDetailPage);
    foodNavigatorKey.currentState?.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const FoooDetailScreen(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  // final Stream<List<FoodItem>> _foodItemsStream = FoodRemoteDataSource().getFoodsStream();

  @override
  Widget build(BuildContext context) {
    final foodItemsStream = ref.watch(foodItemStreamOld.stream);
    // final Stream<List<FoodItem>> foodItemsStream = ref.watch(foodItemStreamProvider);
    // final List<FoodItem> foodList = ref.watch(foodItemListProvider);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Food List Screen'),
            ElevatedButton(
              onPressed: () => _onTap(context),
              child: const Text('Navigate to Food Detail'),
            ),
            // Text(foodList.length.toString()),
            Text(foodItemsStream.toString()),
            StreamBuilder<List<FoodItem>>(
              stream: foodItemsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return Text(snapshot.data?.length.toString() ?? '0');
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data![index].title ?? '');
                    },
                  );
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
