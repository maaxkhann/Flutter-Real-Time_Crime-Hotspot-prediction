import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          fillColor: constantColor,
          filled: true,
          prefixIcon: InkWell(
              onTap: onTapPrefixIcon, child: Icon(prefixIcon, color: kBlack)),
          suffixIcon: InkWell(
            onTap: onTapSuffixIcon,
            child: Icon(
              suffixIcon,
              color: kBlack,
            ),
          ),
          hintText: hintText,
          hintStyle: kBody2Black,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.1),
              borderSide: BorderSide.none),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.1),
              borderSide: BorderSide.none)),
    );
  }
}
