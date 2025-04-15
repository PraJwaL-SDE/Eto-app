import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final InputDecoration? decoration;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final Color? backgroundColor; // Background color for the field
  final bool showBorder; // Whether to show the border

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.maxLength,
    this.maxLines = 1,
    this.decoration,
    this.padding = const EdgeInsets.all(8.0),
    this.textStyle,
    this.backgroundColor,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        enabled: enabled,
        maxLength: maxLength,
        maxLines: maxLines,
        style: textStyle,
        decoration: decoration ??
            InputDecoration(
              hintText: hintText,
              labelText: labelText,
              errorText: errorText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
              filled: true,
              fillColor: backgroundColor ?? Colors.white, // Background color
              border: showBorder
                  ? const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              )
                  : InputBorder.none, // No border if showBorder is false
            ),
      ),
    );
  }
}
