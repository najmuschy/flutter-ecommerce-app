
import 'package:crafty_bay/features/common/ui/screens/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay/features/home/ui/screens/product_categories_screen.dart';
import 'package:flutter/material.dart';
import '../features/auth/ui/screens/login_screen.dart';
import '../features/auth/ui/screens/sign_up.dart';
import '../features/auth/ui/screens/splash_screen.dart';
class AppRoutes{

  static Route<dynamic> routes(RouteSettings settings){
    print(settings.name) ;
  late final Widget screenWidget ;
    if(settings.name == SplashScreen.name){
      screenWidget = SplashScreen() ;
    }
    else if(settings.name== LoginScreen.name){
      screenWidget = LoginScreen();
    }
    else if(settings.name== SignUpScreen.name){
      screenWidget = SignUpScreen();
    }
    else if(settings.name== HomeScreen.name){
      screenWidget = HomeScreen();
    }
    else if(settings.name== MainBottomNavbarScreen.name){
      screenWidget = MainBottomNavbarScreen();
    }
    return MaterialPageRoute(builder: (context)=>screenWidget) ;
  }
}