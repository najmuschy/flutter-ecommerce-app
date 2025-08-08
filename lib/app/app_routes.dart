
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_navbar_screen.dart';

import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay/features/product/data/model/product_category_model.dart';
import 'package:crafty_bay/features/product/data/model/product_category_model.dart';
import 'package:crafty_bay/features/product/data/model/product_model.dart';

import 'package:crafty_bay/features/product/ui/screens/add_review_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_detail_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_reviews_screen.dart';
import 'package:flutter/material.dart';
import '../features/auth/ui/screens/login_screen.dart';
import '../features/auth/ui/screens/sign_up.dart';
import '../features/auth/ui/screens/splash_screen.dart';
import '../features/product/ui/screens/product_categories_screen.dart';
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
    else if(settings.name== ProductCategoriesScreen.name){
      screenWidget = ProductCategoriesScreen();
    }
    else if(settings.name == ProductListScreen.name){
      final args = settings.arguments as Map<String, dynamic>;
      screenWidget = ProductListScreen(
        category: args['category'],
        categoryId: args['categoryId'],
        categoryTitle: args['categoryTitle'],
      );
    }
    else if(settings.name== ProductDetailScreen.name){
      ProductModel product = settings.arguments as ProductModel ;
      screenWidget = ProductDetailScreen(productModel: product,);
    }
    else if(settings.name== ProductReviewsScreen.name){
      screenWidget = ProductReviewsScreen();
    }
    else if(settings.name== AddReviewScreen.name){
      screenWidget = AddReviewScreen();
    }
    else if(settings.name== VerifyOtpScreen.name){
      String email = settings.arguments as String ;
      screenWidget = VerifyOtpScreen(email: email);
    }




    return MaterialPageRoute(builder: (context)=>screenWidget) ;
  }
}