import 'package:crafty_bay/features/product/data/model/product_category_model.dart';
import 'package:crafty_bay/features/product/data/model/product_model.dart';
import 'package:crafty_bay/features/product/data/model/product_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';



class ProductListByCategoryController extends GetxController{


  final List<ProductModel> _productModels = [] ;
  List<ProductModel> get productModels => _productModels ;

  final int _count = 30 ;
  int _currentPage = 0;
  int? _lastPage ;

  bool _productLoadInProgress = false ;
  bool get productLoadInProgress => _productLoadInProgress ;

  bool _productInitialLoadInProgress = false ;
  bool get productInitialLoadInProgress => _productInitialLoadInProgress ;

  String? _message ;
  String get message => _message! ;

  Future<void> getProductList(String? categoryId) async{
    _currentPage++ ;

    if(_lastPage!=null && _lastPage!<_currentPage){
      return ;
    }

    if(_currentPage==1){
      _productModels.clear();
      _message = null ;
      _productInitialLoadInProgress = true ;
      update();
    }else{
      _productLoadInProgress = true ;
      update();
    }

    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(Urls.productListByCategoryUrl(_count, _currentPage, categoryId!));

    if(response.isSuccess){
      _lastPage = response.data!['data']['last_page'] ;
      for(Map<String, dynamic> data in response.data!['data']['results']){
        ProductModel productModel = ProductModel.fromJson(data);
        _productModels.add(productModel);
      }
    }
    else{
      _message = response.errorMessage! ;

    }

    if(_currentPage==1){
      _message = null ;
      _productInitialLoadInProgress = false ;
      update();
    }else{
      _productLoadInProgress = false ;
      update();
    }


  }


}