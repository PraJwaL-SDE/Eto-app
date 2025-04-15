import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:flutter/material.dart';

class ServiceTabBtn extends StatelessWidget {
  final String text;
  final bool selected;

  const ServiceTabBtn({super.key, required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Color(0xFFE6F7FF), // Grey for unselected, white for selected
        borderRadius: BorderRadius.circular(12), // Circular radius
        border: Border.all(
          color: selected ? ConstantColors.primary : Colors.grey, // Green border for selected, none for unselected
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),
    );
  }
}
