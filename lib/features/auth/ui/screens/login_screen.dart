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
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 128, horizontal: 24),
          child: Form(
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
                ElevatedButton(
        
                  onPressed:(){
                    onTapSignIn(context);
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );



    }

  void onTapSignIn(BuildContext context){
    // if(_formKey.currentState!.validate()){
    //
    // }
    Navigator.pushNamed(context, SignUpScreen.name) ;
  }

}
