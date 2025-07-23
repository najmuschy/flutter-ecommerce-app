import 'package:crafty_bay/features/common/controllers/main_bottom_navbar_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoriesScreen extends StatelessWidget {
  const ProductCategoriesScreen({super.key});

  static String name = '/product-categories';
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavbarController>().changeSelectedIndex(0) ;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Categories')),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return FittedBox(child: ProductCategoryItem());
          },
        ),
      ),
    );
  }
}
