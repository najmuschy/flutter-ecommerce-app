import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncDecWidget extends StatefulWidget {
  const IncDecWidget({super.key, required this.onChanged});

  final Function(int) onChanged ;

  @override
  State<IncDecWidget> createState() => _IncDecWidgetState();
}

class _IncDecWidgetState extends State<IncDecWidget> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        GestureDetector(
          onTap: () {
            if (value >1) {
              value--;

              setState(() {});
              widget.onChanged(value);
            }
          },
          child: GestureDetector(child: buildValueChanger(icon: Icons.remove)),
        ),
        Text(value.toString()),
        GestureDetector(
          onTap: () {
            if (value < 20) {
              value++;

              setState(() {});
              widget.onChanged(value);
            }
          },
          child: buildValueChanger(icon: Icons.add),
        ),
      ],
    );
  }

  Container buildValueChanger({required IconData icon}) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(color: AppColors.themeColor),
      child: Icon(icon, color: Colors.white),
    );
  }
}
