 import 'package:flutter/material.dart';

import '../../core/resources/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Color? hintColor;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsets? padding;
  final Color? fillColor;
  final Color borderColor;
  final String? prefixIcon;
  final double borderRadius;
  final double? hintFontSize;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.padding,
    this.borderRadius = 6,
    this.hintColor,
    this.hintFontSize,
    this.fillColor,
    this.borderColor = AppColors.primaryColor,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
         hintText: hintText,
        alignLabelWithHint: true,
        contentPadding: padding ?? EdgeInsets.symmetric(horizontal: 10),


         filled: true,

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor.withValues(alpha: 0.7)),
            borderRadius: BorderRadius.circular(borderRadius)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
    );
  }
}
