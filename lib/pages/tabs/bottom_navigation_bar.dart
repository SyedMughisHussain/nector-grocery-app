import 'package:flutter/material.dart';
import 'package:nector_app/pages/others/home_page.dart';
import 'package:nector_app/utils/colors.dart';

import '../others/cart_page.dart';
import '../others/explore_page.dart';
import '../others/favourite_products_page.dart';
import '../others/user_account_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const ExplorePage(),
    const CartPage(),
    const FavouriteProductsPage(),
    const UserAccountPage(),
  ];

  void onItemTap(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages.elementAt(pageIndex),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: AppColors.splashBackgroundColor,
            unselectedItemColor: AppColors.blackColor,
            showUnselectedLabels: true,
            currentIndex: pageIndex,
            onTap: onItemTap,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_sharp), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_outlined), label: 'Account'),
            ]));
  }
}
