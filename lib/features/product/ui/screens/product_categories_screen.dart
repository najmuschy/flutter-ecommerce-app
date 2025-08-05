import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/controllers/main_bottom_navbar_controller.dart';
import 'package:crafty_bay/features/common/controllers/product_category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoriesScreen extends StatefulWidget {
  ProductCategoriesScreen({super.key});

  static String name = '/product-categories';

  @override
  State<ProductCategoriesScreen> createState() => _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  final ScrollController _scrollController = ScrollController() ;
  final ProductCategoryListController _productCategoryListController = Get.find<ProductCategoryListController>();

  @override
  void initState() {
    _scrollController.addListener(_loadMoreData);
    super.initState();
  }

  void _loadMoreData(){
    if(_scrollController.position.extentAfter<300){
      _productCategoryListController.getCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result){
        if(didPop){
          Get.find<MainBottomNavbarController>().changeSelectedIndex(0) ;
        }

      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Categories')),
        body: GetBuilder(
          init: _productCategoryListController,
          builder: (controller){
            if(controller.categoryInitialLoadInProgress){
              return  CenteredCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                    child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _productCategoryListController.productCategoryModels.length,
                  itemBuilder: (context, index) {
                    return FittedBox(child: ProductCategoryItem(category : _productCategoryListController.productCategoryModels[index]));
                  },
                )),
                Visibility(
                    visible: _productCategoryListController.categoryLoadInProgress,
                    child: LinearProgressIndicator())
              ],
            );
          }

        ),
      ),
    );
  }


}
