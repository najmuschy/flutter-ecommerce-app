import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductSizePicker extends StatefulWidget {
  const ProductSizePicker({
    super.key,
    required this.sizes,
    required this.onChanged,
  });

  final List<String> sizes;
  final Function(String) onChanged;
  @override
  State<ProductSizePicker> createState() => _ProductSizePickerState();
}

class _ProductSizePickerState extends State<ProductSizePicker> {
  String selectedSize = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 4),
        Row(
          spacing: 6,
          children: [
            ...widget.sizes.map((color) => buildColorPicker(color)).toList(),
          ],
        ),
      ],
    );
  }

  GestureDetector buildColorPicker(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
        widget.onChanged(size);
      },
      child: Container(
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          shape: BoxShape.circle,
          color: selectedSize == size ? AppColors.themeColor : Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              size,
              style: TextStyle(
                color: selectedSize == size ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
