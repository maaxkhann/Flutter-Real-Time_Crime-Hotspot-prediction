import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTapPrefixIcon;
  final bool? obscureText;
  const ConstantTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      this.onTapSuffixIcon,
      this.onTapPrefixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          prefixIcon: InkWell(
              onTap: onTapPrefixIcon,
              child: Icon(prefixIcon, color: const Color(0xFFCFCFCF))),
          suffixIcon: InkWell(
            onTap: onTapSuffixIcon,
            child: Icon(
              suffixIcon,
              color: const Color(0xFFCFCFCF),
            ),
          ),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.04),
              borderSide: const BorderSide(color: Color(0xFFA7A7A7))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.04),
              borderSide: const BorderSide(color: Color(0xFFA7A7A7)))),
    );
  }
}
