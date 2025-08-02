import 'dart:convert';

import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
  UserModel? userModel ;
  String? token ;

  final String tokenKey = 'accessToken' ;
  final String userData = 'user-data' ;

  Future<void> setUserData(String accessToken, UserModel model) async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString(tokenKey, accessToken);
    sharedPreferences.setString(userData, jsonEncode(model.toJson()));

    userModel = model ;
    token = accessToken ;
  }

  Future<void> getUserData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
    token = sharedPreferences.getString(tokenKey) ;
    String? userDataString = sharedPreferences.getString(userData) ;
    if(userDataString != null){
      userModel = UserModel.fromJson(jsonDecode(userDataString));
    }
  }

  Future<bool> confirmLogin() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(tokenKey);

    if(accessToken != null){
      await getUserData();
      return true ;
    }
    return false ;
  }
  Future<void> logout() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear() ;
  }
}