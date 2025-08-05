import 'package:crafty_bay/features/product/data/model/product_category_model.dart';
import 'package:flutter/material.dart';


import '../../../product/ui/screens/product_list_screen.dart';
class ProductCategoryItem extends StatefulWidget {
   ProductCategoryItem({
    super.key,
    required this.category,
  });
  ProductCategoryModel category ;
  @override
  State<ProductCategoryItem> createState() => _ProductCategoryItemState();
}

class _ProductCategoryItemState extends State<ProductCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: widget.category);
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              image: DecorationImage(image: NetworkImage(widget.category.iconUrl), fit: BoxFit.cover)
            ),

          ),
          SizedBox(height: 8,),
          Text(_getTitle(widget.category.title), style: Theme.of(context).textTheme.headlineSmall,)
        ],
      ),
    );
  }

  String _getTitle(String title){
    if (title.length > 10) {
      return '${title.substring(0, 9)}...';
    } else {
      return title;
    }
  }
}