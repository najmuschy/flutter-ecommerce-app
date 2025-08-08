import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/product/data/model/product_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/product_list_by_category_controller.dart';
import '../../../common/ui/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key,  this.category, this.categoryId, this.categoryTitle});

  final ProductCategoryModel? category;
  final String? categoryId;
  final String? categoryTitle;
  static String name = '/product-list';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListByCategoryController _productListByCategoryController =
      ProductListByCategoryController();
  @override
  void initState() {
    if (widget.categoryId != null) {
      _productListByCategoryController.getProductList(widget.categoryId!);
    }else{
    _productListByCategoryController.getProductList(widget.category!.id);
    }
    _scrollController.addListener(_loadMoreData);
    super.initState();
  }

  void _loadMoreData() {
    if (_scrollController.position.extentAfter < 300) {
      if (widget.categoryId != null) {
        _productListByCategoryController.getProductList(widget.categoryId!);
      }else{
      _productListByCategoryController.getProductList(widget.category!.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget.categoryTitle!=null ? Text(widget.categoryTitle!) :Text(widget.category!.title)),
      body: GetBuilder<ProductListByCategoryController>(
        init: _productListByCategoryController,
           builder: (controller) {
          if (_productListByCategoryController.productInitialLoadInProgress) {
            return CenteredCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: controller.productModels.length,
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCard(
                        productModel: controller.productModels[index],
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: controller.productLoadInProgress,
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
