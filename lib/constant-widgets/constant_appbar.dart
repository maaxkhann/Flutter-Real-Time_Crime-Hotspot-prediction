import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const ConstantAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      title: Text(
        text,
        style: kHead2White,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Get.width * 0.06),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.08);
}
