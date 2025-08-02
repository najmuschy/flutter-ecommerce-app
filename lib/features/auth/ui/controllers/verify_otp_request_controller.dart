import 'package:crafty_bay/features/auth/data/models/verify_otp_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../core/services/network/network_client.dart';

class VerifyOtpController extends GetxController{
  String? _message ;
  String get message => _message! ;
  bool _verifyInProgress = false ;
  bool get verifyInProgress => _verifyInProgress ;

  Future<bool> verifyOtp(VerifyOtpModel model) async{

    bool isSuccess = false ;
    _verifyInProgress = true ;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().postRequest(Urls.verifyOtpUrl, model.toJson() );

    if(response.isSuccess){
      _message = response.data!['msg'] ;
      isSuccess =true;
    }
    else{
      _message = response.errorMessage! ;
    }

    _verifyInProgress = false ;
    update();
    return isSuccess ;

  }

}