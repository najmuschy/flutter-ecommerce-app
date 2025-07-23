import 'package:get/get.dart';
import 'package:flutter/material.dart';


class MainBottomNavbarController extends GetxController{
  int _selectedIndex= 0;
  int get selectedIndex => _selectedIndex;

   changeSelectedIndex(int index){

    if(_selectedIndex == index) return;

    _selectedIndex = index;

    update();
    return _selectedIndex ;
  }
}