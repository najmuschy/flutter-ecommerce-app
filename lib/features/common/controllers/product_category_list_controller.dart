import 'package:crafty_bay/features/product/data/model/product_category_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';



class ProductCategoryListController extends GetxController{

  final List<ProductCategoryModel> _productCategoryModels = [] ;
  List<ProductCategoryModel> get productCategoryModels => _productCategoryModels ;

  final int _count = 30 ;
  int _currentPage = 0;
  int? _lastPage ;

  bool _categoryLoadInProgress = false ;
  bool get categoryLoadInProgress => _categoryLoadInProgress ;

  bool _categoryInitialLoadInProgress = false ;
  bool get categoryInitialLoadInProgress => _categoryInitialLoadInProgress ;

  String? _message ;
  String get message => _message! ;

  Future<void> getCategoryList() async{
    _currentPage++ ;

    if(_lastPage!=null && _lastPage!<_currentPage){
      return ;
    }

    if(_currentPage==1){
      _productCategoryModels.clear();
      _message = null ;
      _categoryInitialLoadInProgress = true ;
      update();
    }else{
      _categoryLoadInProgress = true ;
      update();
    }

    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(Urls.categoryListUrl(_count, _currentPage));

    if(response.isSuccess){
      _lastPage = response.data!['data']['last_page'] ;
      for(Map<String, dynamic> data in response.data!['data']['results']){
        ProductCategoryModel categoryModel = ProductCategoryModel.fromJson(data);
        _productCategoryModels.add(categoryModel);
      }
    }
    else{
      _message = response.errorMessage! ;

    }

    if(_currentPage==1){
      _message = null ;
      _categoryInitialLoadInProgress = false ;
      update();
    }else{
      _categoryLoadInProgress = false ;
      update();
    }


  }


}