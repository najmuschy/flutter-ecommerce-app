import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/sign_up_model.dart';
import '../widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>() ;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
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
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Enter your email'),
                  validator: (String? value) {
                    String email = value ?? '';
                    if (!EmailValidator.validate(email)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _firstNameTEController,
                  decoration: InputDecoration(
                    hintText: 'Enter your first name',
                  ),
                  validator: (String? value) {
                    String firstName = value?.trim() ?? '';
                    if (firstName.isEmpty) {
                      return 'Enter your firstname';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _lastNameTEController,
                  decoration: InputDecoration(hintText: 'Enter your last name'),
                  validator: (String? value) {
                    String lastName = value?.trim() ?? '';
                    if (lastName.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _mobileTEController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                  validator: (String? value) {
                    String mobile = value?.trim() ?? '';
                    RegExp bdMobile = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
                    if (mobile.isNotEmpty && bdMobile.hasMatch(mobile)) {
                      return null;
                    }
                    return 'Please enter a valid phone number';
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _cityTEController,
                  decoration: InputDecoration(hintText: 'Enter your city'),
                  validator: (String? value) {
                    String city = value ?? '';
                    if (city.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  decoration: InputDecoration(
                    hintText: 'Enter a password more than 6 characters',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      // Check for null first
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                GetBuilder<SignUpController>(builder: (controller){
                  return Visibility(
                      visible: controller.signUpProgress==false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(onPressed: onTapSignIn, child: Text('Sign In')));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onTapSignIn() async {
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
        email: _emailTEController.text.trim(),
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        phone: _mobileTEController.text.trim(),
        city: _cityTEController.text.trim(),
        password: _passwordTEController.text,
      );
      final bool isSuccess = await _signUpController.signUp( signUpModel) ;


      if(isSuccess){
        Get.snackbar('Success', _signUpController.message, colorText: Colors.white, backgroundColor: Colors.green);
        Navigator.pushNamed(context, VerifyOtpScreen.name, arguments: _emailTEController.text.trim());
      }
      else{
        Get.snackbar('Error', _signUpController.message, colorText: Colors.white, backgroundColor: Colors.red, );
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _passwordTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    super.dispose() ;
  }
}
