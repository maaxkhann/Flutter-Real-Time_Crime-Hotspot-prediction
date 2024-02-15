import 'dart:io';

import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  File? image;
  final picker = ImagePicker();
  void pickImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'ProfileView'),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                            onTap: () => pickImage(ImageSource.gallery),
                            child: const Icon(Icons.camera_alt)))
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              ListTile(
                tileColor: constantColor,
                title: Text(
                  'Name',
                  style: kBody1Black,
                ),
                subtitle: Text(
                  'Maaz',
                  style: kBody2Black,
                ),
                trailing: IconButton(
                    onPressed: () {
                      openDialog(context, 'Name', Icons.person);
                    },
                    icon: const Icon(Icons.edit)),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ListTile(
                tileColor: constantColor,
                title: Text(
                  'Email',
                  style: kBody1Black,
                ),
                subtitle: Text(
                  'maaz@gmail.com',
                  style: kBody2Black,
                ),
                trailing: IconButton(
                    onPressed: () {
                      openDialog(context, 'Email', Icons.email);
                    },
                    icon: const Icon(Icons.edit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future openDialog(context, String hintText, IconData icon) async {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            'Update',
            style: kBody1Black,
          ),
          actions: [
            ConstantTextField(hintText: hintText, prefixIcon: icon),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Cancel',
                      style: kBody2Black,
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Update',
                      style: kBody2Black,
                    ))
              ],
            )
          ],
        );
      });
}
