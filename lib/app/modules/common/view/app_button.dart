import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final Widget? leading;
  final Widget? trailing;
  final double borderRadius;
  final EdgeInsets padding;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.textStyle,
    this.leading,
    this.trailing,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: isEnabled ? onPressed : null,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: isEnabled ? backgroundColor : Colors.grey,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) leading!,
              if (leading != null) const SizedBox(width: 8),
              Text(
                text,
                style: textStyle ??
                    TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              if (trailing != null) const SizedBox(width: 8),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
