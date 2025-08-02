import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/ui/screens/product_reviews_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/inc_dec_widget.dart';
import '../widgets/product_carousel.dart';
import '../widgets/product_color_picker.dart';
import '../widgets/product_size_picker.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  static String name = '/product-details';
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductCarousel(),
          SizedBox(height: 8),
          buildProductDetailsTitleSection(),
          SizedBox(height: 8),
          buildProductDetailColorSection(),
          SizedBox(height: 8),
          buildProductDetailSizeSection(),
          SizedBox(height: 8),
          buildProductDescriptionSection(),
          Spacer(),
          buildProductDetailFooterSection(),
        ],
      ),
    );
  }

  Padding buildProductDetailsTitleSection() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            spacing: 6,
            children: [
              Expanded(
                child: Text(
                  'Happy New Year Special Deal Save 30%',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              IncDecWidget(onChanged: (int value) {}),
              SizedBox(width: 8),
            ],
          ),

          Row(
            children: [
              Wrap(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 22),
                  Text(
                    '4.5',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProductReviewsScreen.name);
                },
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Card(
                color: AppColors.themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildProductDetailColorSection() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: ProductColorPicker(
        colors: ['Black', 'Brown', 'Blue', 'White', 'Yellow'],
        onChanged: (String color) {},
      ),
    );
  }

  Padding buildProductDetailSizeSection() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: ProductSizePicker(
        sizes: ['XL', 'L', 'M', 'S', 'XS'],
        onChanged: (String color) {},
      ),
    );
  }

  Padding buildProductDescriptionSection() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.',
          ),
        ],
      ),
    );
  }

  Container buildProductDetailFooterSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: AppColors.themeColor.withAlpha(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '\$1000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.themeColor.withAlpha(500),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
