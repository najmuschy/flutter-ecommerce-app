import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/data/model/product_model.dart';
import 'package:crafty_bay/features/product/ui/screens/product_reviews_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/inc_dec_widget.dart';
import '../widgets/product_carousel.dart';
import '../widgets/product_color_picker.dart';
import '../widgets/product_size_picker.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({super.key, required this.productModel});

  ProductModel productModel;
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductCarousel(photos: widget.productModel.photos),
                  SizedBox(height: 8),
                  buildProductDetailsTitleSection(),
                  SizedBox(height: 8),
                  buildProductDetailColorSection(),
                  SizedBox(height: 8),
                  buildProductDetailSizeSection(),
                  SizedBox(height: 8),
                  buildProductDescriptionSection(),
                ],
              ),
            ),
          ),
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
                  widget.productModel.title,
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
        colors: widget.productModel.colors,
        onChanged: (String color) {},
      ),
    );
  }

  Padding buildProductDetailSizeSection() {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: ProductSizePicker(
        sizes:widget.productModel.sizes,
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
          Text(widget.productModel.description),
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
                '\$${widget.productModel.currentPrice}',
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
