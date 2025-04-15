import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;

  const CustomText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14.0,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
      ),
      overflow: TextOverflow.visible, // Allow wrapping by default
    );
  }
}
