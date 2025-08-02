import 'package:crafty_bay/features/cart/ui/screens/cart_list_screen.dart';
import 'package:crafty_bay/features/common/controllers/main_bottom_navbar_controller.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay/features/home/ui/screens/product_categories_screen.dart';
import 'package:crafty_bay/features/wishlist/ui/screens/wished_products_screen.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';



class MainBottomNavbarScreen extends StatelessWidget {
   MainBottomNavbarScreen({super.key});

   static String name = '/main' ;
  final List<Widget> _screens = [
    HomeScreen(),
    ProductCategoriesScreen(),
    CartListScreen(),
    WishedProductListScreen(),
    ];
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<MainBottomNavbarController>(
      builder: (navController){
        return Scaffold(
          body: _screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: navController.selectedIndex,
              onDestinationSelected: navController.changeSelectedIndex,
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.grid_view_outlined), label: 'Categories'),
                NavigationDestination(icon: Icon(Icons.shopping_basket_outlined), label: 'Cart'),
                NavigationDestination(icon: Icon(Icons.card_giftcard), label: 'Wish'),
              ]
          ),
        );
      },

    );
  }
}
