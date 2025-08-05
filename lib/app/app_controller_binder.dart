import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/ui/controllers/login_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/controllers/main_bottom_navbar_controller.dart';
import 'package:crafty_bay/features/common/controllers/product_category_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controller/home_carousel_controller.dart';
import 'package:get/get.dart';

import '../features/auth/ui/controllers/verify_otp_request_controller.dart';
import '../features/common/controllers/product_list_controller.dart';


class AppControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavbarController()) ;
    Get.put(NetworkClient(onUnAuthorize: onUnAuthorize, commonHeaders: commonHeaders)) ;
    Get.put(SignUpController()) ;
    Get.put(VerifyOtpController()) ;
    Get.put(LoginController()) ;
    Get.put(HomeCarouselController()) ;
    Get.put(ProductCategoryListController()) ;
    Get.put(ProductListController()) ;
    Get.put(AuthController()) ;
  }


  void onUnAuthorize(){
    Get.find<AuthController>().logout();
  }

  Map<String, String> commonHeaders(){

    if(Get.find<AuthController>().token == null){
      return{
        'Content-type' : 'application/json'
      };
    }
    return {
      'Content-Type' : 'application/json',
      'token' : Get.find<AuthController>().token!,
    };

  }

}