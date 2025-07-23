import 'package:crafty_bay/app/asset_path.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart' ;



class AppLogo extends StatelessWidget {
  AppLogo({super.key, this.width, this.height});
  double? width ;
  double? height ;
  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(AssetPaths.appLogo, width: width?? 160, height: height) ;
  }
}
