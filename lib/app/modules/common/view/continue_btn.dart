import 'package:flutter/material.dart';

class ContinueBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool showArrow; // New parameter to control arrow visibility

  const ContinueBtn({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.showArrow = true, // Default is true
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Max width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(vertical: 16), // Adjust height
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (showArrow) // Show arrow only if showArrow is true
              Padding(
                padding: const EdgeInsets.only(left: 8.0), // Add space before arrow
                child: Image.asset(
                  "assets/images/continue_btn_arrow.png",
                  height: 17,
                  width: 17,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
