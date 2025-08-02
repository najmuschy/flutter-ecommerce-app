import 'package:flutter/material.dart';


class AppBarActions extends StatelessWidget {
   const AppBarActions({
    super.key,
    required this.iconData,
    required this.onTap,
     required this.color
  });
  final VoidCallback onTap ;
  final IconData iconData ;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 20,
          child: Icon(iconData, color:color,)
      ),
    );
  }
}