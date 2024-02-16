import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyServicesView extends StatelessWidget {
  const EmergencyServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Emergency Services'),
        body: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/police.jpeg',
                      height: Get.height * 0.1,
                    ),
                    ReUsableColumn(
                      text: 'Police',
                      number: '1212',
                      onTap: () => dialNumber('1212'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/ambulance.jpeg',
                    height: Get.height * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: ReUsableColumn(
                      text: 'Ambulance',
                      number: '112',
                      onTap: () => dialNumber('112'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/firebrigade.jpeg',
                    height: Get.height * 0.05,
                  ),
                  ReUsableColumn(
                    text: 'Fire Brigade',
                    number: '4214',
                    onTap: () => dialNumber('4214'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReUsableColumn extends StatelessWidget {
  final String text;
  final String number;
  final VoidCallback onTap;
  const ReUsableColumn({
    super.key,
    required this.text,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: kBody1Black,
        ),
        Row(
          children: [
            Text(
              'Call: ',
              style: kBody2Black,
            ),
            Text(
              number,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(
              width: 10.r,
            ),
            InkWell(
              onTap: onTap,
              child: Icon(
                Icons.call,
                size: 20.r,
              ),
            )
          ],
        ),
      ],
    );
  }
}

Future<void> dialNumber(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
