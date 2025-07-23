
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{

  static ThemeData get lightThemeData{
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.getMaterialColor(AppColors.themeColor),
      ),
            textTheme: textTheme,
      inputDecorationTheme: textFieldTheme(AppColors.themeColor),
      elevatedButtonTheme: elevatedButtonTheme,
      navigationBarTheme: navBarTheme
    );
  }

  static  ElevatedButtonThemeData get elevatedButtonTheme{
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          )
      ),
    );

  }

  static  InputDecorationTheme textFieldTheme(Color color){
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.themeColor
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.themeColor
          )
      ),
      focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.themeColor
          )
      ),
      errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red
          )
      ) ,
    );
  }
  static get  textTheme{
    return TextTheme(
        titleLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          color: Colors.grey,
      ),
        titleMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
        headlineSmall: TextStyle(
        fontSize: 14,
        color: AppColors.themeColor,
        fontWeight: FontWeight.w400,
      )
    );
  }
  static get navBarTheme{
    return NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                (states) => IconThemeData(color : states.contains(WidgetState.selected)? AppColors.themeColor : Colors.black )
        ),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (states) => TextStyle(fontSize: 12, color: states.contains(WidgetState.selected)? AppColors.themeColor : Colors.black,
              fontWeight: FontWeight.w400,
            )
        )
    );
  }
}