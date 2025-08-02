import 'package:crafty_bay/features/product/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.name);
      },
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Container(
          margin: EdgeInsets.only(right: 4),
          width: 120,
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
              buildProductCardDescription(context)
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
            width: 120,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset('assets/images/nike-shoe.png'),
            ),
          );
  }
  Padding buildProductCardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Text(
            'New Year Special Shoe',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$100',
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
                  child: Icon(Icons.favorite_outline,
                      size: 12, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


