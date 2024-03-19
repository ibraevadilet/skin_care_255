import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final Color borderColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? icon;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.maxLine,
    this.textInputType,
    required this.borderColor,
    this.controller,
    this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLine,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1.w)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1.w)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1.w)),
      ),
    );
  }
}
