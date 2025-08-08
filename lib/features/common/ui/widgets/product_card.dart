import 'package:crafty_bay/features/product/data/model/product_model.dart';
import 'package:crafty_bay/features/product/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key, required this.productModel});
  ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailScreen.name,
          arguments: widget.productModel,
        );
      },
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Container(
          margin: EdgeInsets.only(right: 4),
          width: 125,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildProductCardImage(),
              const SizedBox(height: 4),
              buildProductCardDescription(context),
            ],
          ),
        ),
      ),
    );
  }

  Container buildProductCardImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
        color: AppColors.themeColor.withAlpha(100),
      ),
      height: 100,
      width: 160,
      child: Container(
        decoration: BoxDecoration(
          image:
              widget.productModel.photos.isNotEmpty
                  ? DecorationImage(
                    image: NetworkImage(widget.productModel.photos.first),
                    fit: BoxFit.fill,
                  )
                  : DecorationImage(
                    image: AssetImage('assets/images/no_photo.png', ),
                    fit: BoxFit.fill
                  ),
        ),
      ),
    );
  }

  Padding buildProductCardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Column(
        children: [
          Text(
            widget.productModel.title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${widget.productModel.currentPrice}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Wrap(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  Text('4.5', style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(width: 8),
              Card(
                color: AppColors.themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 12,
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
}
