import 'package:elvan/core/models/food/food_item.dart';
import 'package:elvan/navigation/root_navigator.dart';
import 'package:elvan/network/food/food_remote.dart';
import 'package:flutter/material.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(routeFoodDetailPage);
  }

  final Stream<List<FoodItem>> _foodItemsStream = FoodRemoteDataSource().getFoodsStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Food List Screen'),
            ElevatedButton(
              onPressed: () => _onTap(context),
              child: const Text('Navigate to Food Detail'),
            ),
            StreamBuilder<List<FoodItem>>(
              stream: _foodItemsStream,
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
