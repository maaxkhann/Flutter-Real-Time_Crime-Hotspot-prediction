import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantCategory extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const ConstantCategory(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          width: Get.width * 0.56,
          height: Get.height * 0.09,
          decoration: BoxDecoration(
              color: kButtonColor,
              borderRadius: BorderRadius.circular(Get.width * 0.02)),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(icon, size: constraints.maxHeight * 0.5, color: kWhite),
                  SizedBox(
                    width: constraints.maxWidth * 0.05,
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: kHead1White,
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
