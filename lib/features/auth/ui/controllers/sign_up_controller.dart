import 'package:crafty_bay/app/urls.dart';
import 'package:get/get.dart';

import '../../../../core/services/network/network_client.dart';
import '../../data/models/sign_up_model.dart';


class SignUpController extends GetxController{
  bool _signUpProgress= false ;
  bool get signUpProgress => _signUpProgress ;

  late String _message ;
  String get message => _message ;

  Future<bool> signUp(SignUpModel signUpModel) async{
    bool isSuccess = false ;
    _signUpProgress = true ;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>().postRequest(Urls.signUpUrl, signUpModel.toJson());

    if(response.isSuccess){
     isSuccess= true;
     _message = response.data!['msg'] ;
    }
    else{
      isSuccess = false ;
      _message = response.errorMessage! ;
    }


    _signUpProgress = false ;
    update();
    return isSuccess ;

  }

}