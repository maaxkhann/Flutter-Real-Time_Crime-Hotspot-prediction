import 'package:crime_management_system/constant-widgets/constant_home_category.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/crime-rate/crime_rate_view.dart';
import 'package:crime_management_system/home-view/crime_prediction_view.dart';
import 'package:crime_management_system/home-view/registration-form/registration_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: constantColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Home',
            style: kHead1White,
          ),
          actions: [
            PopupMenuButton(
                color: kWhite,
                iconColor: kWhite,
                itemBuilder: ((context) => <PopupMenuEntry>[
                      PopupMenuItem(
                          child: Text(
                        'About Us',
                        style: kBody1Black,
                      ))
                    ]))
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.06),
            child: Column(
              children: [
                ConstantCategory(
                  text: 'Report Registration',
                  icon: Icons.report,
                  onTap: () => Get.to(() => const RegistrationFormView()),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ConstantCategory(
                  text: 'Emergency Service',
                  icon: Icons.contact_emergency_sharp,
                  onTap: () => dialNumber('332111'),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ConstantCategory(
                  text: 'Crime Prediction',
                  icon: Icons.online_prediction,
                  onTap: () => Get.to(() => const CrimePredictionView()),
                ),
              ],
            ),
          ),
        ),
      ),
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
