import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_path.dart';
import 'package:crafty_bay/features/home/ui/screens/product_categories_screen.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/ui/widgets/product_category_item.dart';
import '../widgets/appbar_actions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String name = '/home';

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
              HomeCarousel(),
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
                onTapSeeAll: () {},
              ),
              buildSectionHeading(
                context,
                title: 'Special',
                onTapSeeAll: () {},
              ),
              buildSectionHeading(context, title: 'New', onTapSeeAll: () {}),
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ProductCategoryItem(),
          );
        },
      ),
    );
  }
}


