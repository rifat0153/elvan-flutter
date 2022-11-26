import 'package:elvan/features/cart/views/cart_screen.dart';
import 'package:elvan/features/favorite/views/favorite_screen.dart';
import 'package:elvan/features/food/views/food_detail.dart';
import 'package:elvan/navigation/food_navigator.dart';
import 'package:elvan/navigation/root_navigator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = [
    FoodNavigator(foodPageRoute: routeFoodListPage),
    // FoodNavigatorWrapper(),
    FavoriteScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
      body: SafeArea(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
