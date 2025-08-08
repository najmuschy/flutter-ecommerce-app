import 'package:crafty_bay/features/common/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_model.dart';

class LoginController extends GetxController{

  bool _loginInProgress = false ;
  bool get loginInProgress => _loginInProgress ;

  String? _message ;
  String get message => _message! ;

  Future<bool> login(LoginRequestModel loginRequestModel) async{
    AuthController authController = Get.find<AuthController>() ;
    bool isSuccess = false ;
    _loginInProgress = true ;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().postRequest(Urls.loginUrl, loginRequestModel.toJson());

    if(response.isSuccess){
      isSuccess = true ;
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.data!);
      authController.setUserData(loginResponseModel.token, loginResponseModel.userModel);
      _message = response.data!['msg'] ;
    }
    else{
      _message = response.errorMessage! ;

    }
    _loginInProgress = false ;
    update();
    return isSuccess ;
  }
}