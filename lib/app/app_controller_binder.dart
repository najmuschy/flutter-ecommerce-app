import 'package:crafty_bay/features/common/controllers/main_bottom_navbar_controller.dart';
import 'package:get/get.dart';


class AppControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavbarController()) ;
  }


}