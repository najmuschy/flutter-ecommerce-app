import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/ui/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../../common/ui/screens/main_bottom_navbar_screen.dart';
import '../../data/models/login_request_model.dart';
import 'sign_up.dart';
import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String name = '/login';
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>() ;
  final LoginController _loginController = Get.find<LoginController>() ;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 128, horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppLogo(width: 90, height: 97),
                Text('Complete Profile', style: textTheme.titleLarge),
                Text(
                  'Enter your email and password',
                  style: textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailTEController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  validator: (String? value){
                    String email = value ?? '';
                    if(!EmailValidator.validate(email)){
                      return 'Please enter valid email';
                    }
                    return null ;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Enter your password'),
                  validator: (String? value){
                    if (value == null || value.isEmpty) { // Check for null first
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                GetBuilder(
                    init: _loginController,
                    builder: (controller){
                      return Visibility(
                        visible: controller.loginInProgress==false,
                        replacement: CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed:(){
                            onTapSignIn(context);
                          },
                          child: Text('Sign In'),
                        ),
                      );
                    })


              ],
            ),
          ),
        ),
      ),
    );



    }

  void onTapSignIn(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      LoginRequestModel loginRequestModel = LoginRequestModel(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
      );
      final bool isSuccess = await _loginController.login(loginRequestModel);

      if(isSuccess){
        Navigator.pushNamedAndRemoveUntil(context, MainBottomNavbarScreen.name, (predicate)=>false);
        Get.snackbar('Success', _loginController.message, backgroundColor: Colors.green, colorText: Colors.white) ;
        }
      else{
        Get.snackbar('Error', _loginController.message, backgroundColor: Colors.red, colorText: Colors.white);
      }
    }

  }

}
