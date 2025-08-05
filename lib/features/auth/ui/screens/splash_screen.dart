import 'package:crafty_bay/features/auth/ui/screens/sign_up.dart';

import 'package:flutter/material.dart';

import '../../../common/ui/screens/main_bottom_navbar_screen.dart';
import '../widgets/app_logo.dart';



class SplashScreen extends StatefulWidget {
  static String name = '/' ;
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();

  }
  Future<void> moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainBottomNavbarScreen.name);
  }

  @override
  Widget build(BuildContext context) {



  TextTheme textTheme = Theme.of(context).textTheme ;
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text('Version 1.0.0', style: textTheme.titleSmall,)
            ],
          ),
        ),
      ),
    );
  }
}
