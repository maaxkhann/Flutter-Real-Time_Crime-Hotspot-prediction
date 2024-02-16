import 'package:crime_management_system/constant-widgets/constant_home_category.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/view/home-view/crime_prediction_view.dart';
import 'package:crime_management_system/view/home-view/emergency_services_view.dart';
import 'package:crime_management_system/view/home-view/registration-form/registration_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(Get.width * 0.04),
            ),
          ),
          title: Text(
            'Home',
            style: kHead1White,
          ),
          actions: [
            PopupMenuButton(
                color: constantColor,
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
            padding: EdgeInsets.symmetric(
                vertical: Get.height * 0.02, horizontal: Get.width * 0.03),
            child: Column(
              children: [
                Text(
                  'Report a crime and stay safe',
                  style: kHead2Black,
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: Get.width * 0.03,
                        mainAxisSpacing: Get.height * 0.015),
                    children: [
                      ConstantHomeCategory(
                          text: 'Report Registration',
                          icon: Icons.report,
                          onTap: () =>
                              Get.to(() => const RegistrationFormView())),
                      ConstantHomeCategory(
                          text: 'Crime Prediction',
                          icon: Icons.online_prediction,
                          onTap: () =>
                              Get.to(() => const CrimePredictionView())),
                      ConstantHomeCategory(
                          text: 'Emergency Services',
                          icon: Icons.call,
                          onTap: () =>
                              Get.to(() => const EmergencyServicesView())),
                      ConstantHomeCategory(
                          text: 'Awarness Article',
                          icon: Icons.article,
                          onTap: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
