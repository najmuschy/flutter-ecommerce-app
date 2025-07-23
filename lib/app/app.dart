import 'package:crafty_bay/app/app_controller_binder.dart';
import 'package:crafty_bay/app/app_routes.dart';
import 'package:crafty_bay/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/auth/ui/screens/splash_screen.dart';


class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SplashScreen.name,
      theme: AppTheme.lightThemeData,
      onGenerateRoute: AppRoutes.routes,
      initialBinding: AppControllerBinder(),

    );
  }
}
