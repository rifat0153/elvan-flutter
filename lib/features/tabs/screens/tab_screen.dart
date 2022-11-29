import 'package:elvan/features/cart/screens/cart_screen.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/home/screens/home_screen.dart';
import 'package:elvan/features/login/screens/login_screen.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabScreen extends HookWidget {
  static const List<Widget> _pages = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState(0);

    void _onItemTapped(int index) {
      _selectedIndex.value = index;
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(AppColors.primaryColor),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(AppColors.primaryColor),
        currentIndex: _selectedIndex.value,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Container(
                width: 64,
                height: 32,
                decoration: BoxDecoration(
                    color: _selectedIndex.value == 0
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
                    color: _selectedIndex.value == 1
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
                    color: _selectedIndex.value == 2
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
                    color: _selectedIndex.value == 3
                        ? Colors.white
                        : const Color(AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(child: _pages.elementAt(_selectedIndex.value)),
    );
  }
}
