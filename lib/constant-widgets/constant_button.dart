import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConstantButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const ConstantButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: Get.height * 0.069,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2.r,
              blurRadius: 6.r,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(Get.width * 0.1),
          //  border: Border.all(color: Colors.white, width: 2),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: kHead3White,
          ),
        ),
      ),
    );
  }
}
