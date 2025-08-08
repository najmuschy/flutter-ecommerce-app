

import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/product/data/model/product_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';

class PopularProductController extends GetxController{

  String id = '67c35af85e8a445235de197b' ;
  String title = 'Popular' ;
  bool _inProgress= false ;
  bool get inProgress => _inProgress;

  String? _message ;
  String get message => _message!;

  final List<ProductModel> _productModels = [];
  List<ProductModel> get productModels => _productModels;

  Future<void> getPopularProducts() async{
    _inProgress = true;
    update();


    NetworkResponse response = await Get.find<NetworkClient>().getRequest(Urls.popularProductUrl);

    if(response.isSuccess) {
      for (Map<String, dynamic> product in response.data!['data']['results']) {
        ProductModel productModel = ProductModel.fromJson(product, categoryId: id, categoryTitle: title);
        _productModels.add(productModel);
        _message = response.data!['msg'];
      }
    }
      else{
        _message = response.data!['msg'];
     }

      _inProgress = false;
      update();


    }

  }
