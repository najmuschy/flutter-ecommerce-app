import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/verify_otp_request_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../ui/widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  static String name = '/verify-otp';
  final String email ;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _pinCodeTEController = TextEditingController();
  final VerifyOtpController _verifyOtpController = Get.find<VerifyOtpController>() ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Text('Verify OTP', style: textTheme.titleLarge),
                Text(
                  'A pin code of 4 digits has been sent to you email',
                  style: textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: false,
                    controller: _pinCodeTEController,


                    appContext: context,
                  ),
                ),

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


      VerifyOtpModel verifyOtpModel = VerifyOtpModel(
        email: widget.email,
        otp: _pinCodeTEController.text,
      );
      final bool isSuccess = await _verifyOtpController.verifyOtp(verifyOtpModel) ;


      if(isSuccess){
        Get.snackbar('Success', _verifyOtpController.message, colorText: Colors.white, backgroundColor: Colors.green);
        Navigator.pushNamed(context, LoginScreen.name);
      }
      else{
        Get.snackbar('Error', _verifyOtpController.message, colorText: Colors.white, backgroundColor: Colors.red, );
        _pinCodeTEController.clear() ;
      }

  }

  @override
  void dispose() {
    _pinCodeTEController.dispose();

    super.dispose() ;
  }
}
