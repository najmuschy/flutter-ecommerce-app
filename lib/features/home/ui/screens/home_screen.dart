import 'package:crafty_bay/app/asset_path.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/controllers/product_category_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controller/home_carousel_controller.dart';
import 'package:crafty_bay/features/product/ui/screens/product_categories_screen.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_carousel.dart';
import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/controllers/product_list_controller.dart';
import '../../../common/ui/widgets/product_card.dart';
import '../../../common/ui/widgets/product_category_item.dart';
import '../widgets/appbar_actions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static String name = '/home';
  final HomeCarouselController _homeCarouselController =
      Get.find<HomeCarouselController>();
  final ProductCategoryListController _productCategoryListController = Get.find<ProductCategoryListController>();
  final ProductListController _productListController = Get.find<ProductListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Column(
            children: [
              SizedBox(width: 383, child: buildSearchBar()),
              SizedBox(height: 8),
              GetBuilder(
                init: _homeCarouselController,
                builder: (controller) {
                  return SizedBox(
                    height: 212,
                    child: Visibility(
                      visible: controller.carouselInProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: HomeCarousel(sliderItems : controller.homeCarouselModels),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              buildSectionHeading(
                context,
                title: 'All Categories',
                onTapSeeAll: () {
                  Navigator.pushNamed(context, ProductCategoriesScreen.name);
                },
              ),
              buildProductCategories(),
              buildSectionHeading(
                context,
                title: 'Popular',
                onTapSeeAll: () {

                },
              ),
              buildPopularProducts(),
              buildSectionHeading(
                context,
                title: 'Special',
                onTapSeeAll: () {},
              ),
              buildSpecialProducts(),
              buildSectionHeading(context, title: 'New', onTapSeeAll: () {}),
              buildNewProducts(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navLogo),
      actions: [
        AppBarActions(
          iconData: Icons.person_outline,
          color: Colors.grey,
          onTap: () {},
        ),
        SizedBox(width: 8),
        AppBarActions(
          iconData: Icons.phone_outlined,
          color: Colors.grey,
          onTap: () {},
        ),

        SizedBox(width: 8),
        AppBarActions(
          iconData: Icons.notifications_active_outlined,
          color: Colors.grey,
          onTap: () {},
        ),
        SizedBox(width: 8),
      ],
    );
  }

  TextField buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsetsGeometry.symmetric(horizontal: 8),
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Colors.grey,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Padding buildSectionHeading(
    BuildContext context, {
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          TextButton(
            onPressed: onTapSeeAll,
            child: Text(
              'See All',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildProductCategories() {
    return SizedBox(
      height: 100,
      child: GetBuilder(
        init: _productCategoryListController,
        builder: (controller){
          return Visibility(
            visible: controller.categoryInitialLoadInProgress == false,
            replacement: CenteredCircularProgressIndicator(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ProductCategoryItem(category: _productCategoryListController.productCategoryModels[index],),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildPopularProducts() {
    return SizedBox(
      height: 160,
      child: GetBuilder(
        init: _productListController,
        builder: (controller){
          if(controller.productLoadInProgress){
            return CenteredCircularProgressIndicator() ;
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.productModels.length,
            itemBuilder: (context, index) {
              return
                ProductCard(productModel: controller.productModels[index],);
              ;
            },
          );
        },
        
      ),
    );
  }

  Widget buildSpecialProducts() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          // return ProductCard();
          return;
        },
      ),
    );
  }

  Widget buildNewProducts() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          // return ProductCard();
          return;
        },
      ),
    );
  }
}
