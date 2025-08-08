import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
   bool _inProgress = false ;
   bool get inProgress => _inProgress ;

   String? _message ;
   String get message => _message! ;

   Future<bool> addToCart(String productId) async{
      bool isSuccess = false ;
     _inProgress = true ;
      update();

      Map<String, dynamic> body = {
        'product': productId,
      };
      NetworkResponse response = await Get.find<NetworkClient>().postRequest(Urls.addToCart, body);

      if(response.isSuccess){
        isSuccess = true ;
        _message = response.data!['msg'] ;
        _inProgress = false ;
        update();
      }else{
        _message = response.errorMessage?? 'Something went wrong';
        _inProgress = false ;
        update();
      }



      return isSuccess ;

   }
}