import 'package:crafty_bay/features/auth/data/models/user_model.dart';

class LoginResponseModel{
  final String  status ;
  final String token ;
  final UserModel userModel;

  LoginResponseModel({required this.status, required this.token, required this.userModel});

  factory LoginResponseModel.fromJson(Map<String, dynamic> jsonData){

    return LoginResponseModel(
      status: jsonData['status'] ?? '',
      token: jsonData['data']['token']?? '',
      userModel: UserModel.fromJson(jsonData['data']['user'] ?? {}),
    );
  }

}