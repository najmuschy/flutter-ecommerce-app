import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductColorPicker extends StatefulWidget {
  const ProductColorPicker({
    super.key,
    required this.colors,
    required this.onChanged,
  });

  final List<String> colors;
  final Function(String) onChanged;
  @override
  State<ProductColorPicker> createState() => _ProductColorPickerState();
}

class _ProductColorPickerState extends State<ProductColorPicker> {
  String selectedColor = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 4),
        Row(
          spacing: 4,
          children: [
            ...widget.colors.map((color) => buildColorPicker(color)).toList(),
          ],
        ),
      ],
    );
  }

  GestureDetector buildColorPicker(String color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
        widget.onChanged(color);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black),
          color: selectedColor == color ? AppColors.themeColor : Colors.white,
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(6),
          child: Text(
            color,
            style: TextStyle(
              color: selectedColor == color ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
