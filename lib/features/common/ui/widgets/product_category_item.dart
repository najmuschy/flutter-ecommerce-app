import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.themeColor.withAlpha(100),
          ),
          child: Icon(Icons.tv, color: AppColors.themeColor, size: 40),

        ),
        SizedBox(height: 8,),
        Text('Electronics', style: Theme.of(context).textTheme.headlineSmall,)
      ],
    );
  }
}