import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';
import '../../data/models/cart_model.dart';

class CartController extends GetxController{
  double totalPrice = 0 ;
  double get total => totalPrice ;
  bool _inProgress = false ;
  bool get inProgress => _inProgress ;

  String? _message ;
  String get message => _message! ;

  List<CartModel> _cartList = [] ;
  List<CartModel> get cartList => _cartList ;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    _cartList.clear() ;
    NetworkResponse response = await Get.find<NetworkClient>().getRequest(Urls.getCart);

    if(response.isSuccess){
      for(Map<String, dynamic> item in response.data!['data']['results']){
        CartModel cartModel = CartModel.fromJson(item);
        _cartList.add(cartModel);
      }
      totalPriceCalculator();
      isSuccess = true ;
    }
    else{
      _message = response.errorMessage?? 'Something went wrong';
    }

    _inProgress = false ;
    update();
    return isSuccess ;

  }


  Future<bool> deleteCartList(String cartId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().deleteRequest(Urls.deleteCart(cartId));

    if(response.isSuccess){
      for(CartModel cartModel in _cartList){
        if(cartModel.id == cartId){
          _cartList.remove(cartModel);
          getCartList();
          update();
        }
      }
      isSuccess = true ;
    }
    else{
      _message = response.errorMessage?? 'Something went wrong';
    }

    _inProgress = false ;
    update();
    return isSuccess ;

  }

  void totalPriceCalculator(){
    totalPrice = 0 ;
    for(CartModel cartModel in _cartList){
      totalPrice += cartModel.productModel.currentPrice * cartModel.quantity ;
    }
    update();
  }

  void updateQuantity(String productId, int quantity){
    for(CartModel cartModel in _cartList){
     if(cartModel.productModel.id == productId){
      cartModel.quantity = quantity ;
     }
      totalPriceCalculator();
    }
  }
}