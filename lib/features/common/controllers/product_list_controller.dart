import 'package:crafty_bay/features/product/data/model/product_category_model.dart';
import 'package:crafty_bay/features/product/data/model/product_model.dart';
import 'package:crafty_bay/features/product/data/model/product_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';



class ProductListController extends GetxController{

  final List<ProductModel> _productModels = [] ;
  List<ProductModel> get productModels => _productModels ;
  late final ProductModel _productModel ;
  ProductModel get productModel => _productModel ;
  // final int _count = 30 ;
  // int _currentPage = 0;
  // int? _lastPage ;

  bool _productLoadInProgress = false ;
  bool get productLoadInProgress => _productLoadInProgress ;

  // bool _productInitialLoadInProgress = false ;
  // bool get productInitialLoadInProgress => _productInitialLoadInProgress ;

  String? _message ;
  String get message => _message! ;

  Future<void> getProductList() async{
    // _currentPage++ ;

    // if(_lastPage!=null && _lastPage!<_currentPage){
    //   return ;
    // }


      _productLoadInProgress = true ;
      update();


    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(Urls.productListUrl);

    if(response.isSuccess){
      // _lastPage = response.data!['data']['last_page'] ;
      _productModel = ProductModel.fromJson(response.data!['data']['results']);
      for(Map<String, dynamic> data in response.data!['data']['results']){
        ProductModel productModel = ProductModel.fromJson(data);
        _productModels.add(productModel);
      }
    }
    else{
      _message = response.errorMessage! ;

    }


      _productLoadInProgress = false ;
      update();



  }


}