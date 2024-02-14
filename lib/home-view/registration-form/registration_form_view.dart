import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constant-widgets/location_dropdown_button.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/home-view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationFormView extends StatefulWidget {
  const RegistrationFormView({super.key});

  @override
  State<RegistrationFormView> createState() => _RegistrationFormViewState();
}

class _RegistrationFormViewState extends State<RegistrationFormView> {
  List<String> location = ['G Sector', 'E Sector', 'I Sector'];
  TextEditingController dateController = TextEditingController();

  void showDate(context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024, 2),
        lastDate: DateTime(2025, 12),
        builder: (context, picker) {
          return Theme(
            //TODO: change colors
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor: Colors.green[900],
            ),
            child: picker!,
          );
        }).then((selectedDate) {
      //TODO: handle selected date
      if (selectedDate != null) {
        dateController.text = selectedDate.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Report ',
                          style: kHead1Black,
                          children: [
                            TextSpan(text: 'Registration', style: kHead1Grey)
                          ])),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Name',
                  style: kBody1Black,
                ),
                const ConstantTextField(
                  hintText: 'Name',
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Location',
                  style: kBody1Black,
                ),
                LocationDropDownButton(
                    location: location, hintText: 'Location'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Date',
                  style: kBody1Black,
                ),
                ConstantTextField(
                  onTapPrefixIcon: () => showDate(context),
                  hintText: 'Date',
                  prefixIcon: Icons.date_range,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Category',
                  style: kBody1Black,
                ),
                const ConstantTextField(
                  hintText: 'Category',
                  prefixIcon: Icons.category,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Details',
                  style: kBody1Black,
                ),
                const ConstantTextField(
                  hintText: 'Details',
                  prefixIcon: Icons.details,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  children: [
                    ReUsableContainer(
                      text: 'Upload Picture',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    ReUsableContainer(
                      text: 'Upload Video',
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                ConstantButton(
                    buttonText: 'Submit Data',
                    onTap: () => Get.to(() => const HomeView())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReUsableContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ReUsableContainer({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        width: Get.width * 0.45,
        height: Get.height * 0.09,
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(Get.width * 0.06),
            border: Border.all(color: const Color(0xFFA7A7A7))),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload,
                color: Color(0xFFA7A7A7),
                //   size: 30.r,
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                text,
                style: kBody1Transparent,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
