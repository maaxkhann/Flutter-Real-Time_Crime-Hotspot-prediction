import 'package:crime_management_system/constant-widgets/constant_home_category.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/view-model/auth_view_model.dart';
import 'package:crime_management_system/view/home-view/about_us_view.dart';
import 'package:crime_management_system/view/home-view/crime_prediction_view.dart';
import 'package:crime_management_system/view/home-view/emergency_services_view.dart';
import 'package:crime_management_system/view/home-view/registration-form/registration_form_view.dart';
import 'package:crime_management_system/view/home-view/security_tips_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
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
            InkWell(
              onTap: () {
                AlertDialog(
                  title: const Text('Are you sure to logout?'),
                  actions: [
                    TextButton(
                        onPressed: () => authViewModel.signOut(),
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () => Get.back(), child: const Text('No')),
                  ],
                ).show(context);
              },
              child: Icon(
                Icons.logout,
                color: kWhite,
              ),
            ),
            PopupMenuButton(
                color: constantColor,
                iconColor: kWhite,
                itemBuilder: ((context) => <PopupMenuEntry>[
                      PopupMenuItem(
                          onTap: () => Get.to(() => const AboutUsView()),
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
                          text: 'Security Tips',
                          icon: Icons.article,
                          onTap: () => Get.to(() => const SecurityTipsView())),
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
