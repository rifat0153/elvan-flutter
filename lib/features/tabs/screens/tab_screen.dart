import 'package:elvan/features/cart/screens/cart_screen.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/home/screens/home_screen.dart';
import 'package:elvan/features/login/screens/login_screen.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  static const List<Widget> _pages = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(AppColors.primaryColor),
        //fixedColor: Colors.green,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(AppColors.primaryColor),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(
                width: 64,
                height: 32,
                decoration: BoxDecoration(
                    color: _selectedIndex == 0
                        ? Colors.white
                        : const Color(AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
                width: 64,
                height: 32,
                decoration: BoxDecoration(
                    color: _selectedIndex == 1
                        ? Colors.white
                        : const Color(AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.favorite)),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Container(
                width: 64,
                height: 32,
                decoration: BoxDecoration(
                    color: _selectedIndex == 2
                        ? Colors.white
                        : const Color(AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.shopping_bag)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Container(
                width: 64,
                height: 32,
                decoration: BoxDecoration(
                    color: _selectedIndex == 3
                        ? Colors.white
                        : const Color(AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.favorite)),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
