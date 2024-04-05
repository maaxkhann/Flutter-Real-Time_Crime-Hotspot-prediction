import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'About CrimeAlertPro'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'Welcome to the CrimeAlertPro-Your Trusted Partner in Community Safety!',
                  style: kBody1Transparent,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'Our Mission',
                  style: kHead3Black,
                ),
                Text(
                  'Empowering communities with safety tools and fostering security. We believe that proactive measures, informed decisions, and a united community are fundamental elements in creating safer living environments.',
                  style: kBody2Black,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'What Sets Us Apart',
                  style: kHead3Black,
                ),
                Text(
                  'Innovative Crime Hotspot Prediction: ',
                  style: kHead3Black,
                ),
                Text(
                  'Stands at the forefront of innovation with our cutting-edge technology. We leverage predictive analytics and machine learning to identify potential crime hotspots, providing users with valuable insights.',
                  style: kBody2Black,
                ),
                Text(
                  'User-Centric Approach: ',
                  style: kHead3Black,
                ),
                Text(
                  'Designed with the end user in mind, ensuring a seamless experience. We prioritize user feedback and continuously enhance the functionality and usability of our app.',
                  style: kBody2Black,
                ),
                Text(
                  'Community Empowerment: ',
                  style: kHead3Black,
                ),
                Text(
                  'Encourages community members to actively participate in safety initiatives, share information, and work together to create secure neighborhoods.',
                  style: kBody2Black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
