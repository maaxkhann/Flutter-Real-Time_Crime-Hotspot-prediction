import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constant-widgets/location_dropdown_button.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/view-model/report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegistrationFormView extends StatefulWidget {
  const RegistrationFormView({super.key});

  @override
  State<RegistrationFormView> createState() => _RegistrationFormViewState();
}

class _RegistrationFormViewState extends State<RegistrationFormView> {
  List<String> location = ['G Sector', 'E Sector', 'I Sector'];
  final ValueNotifier<String> selectedLocation = ValueNotifier<String>('');
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

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
    final reportViewModel =
        Provider.of<ReportViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Report Registration'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // Center(
                //   child: RichText(
                //       textAlign: TextAlign.center,
                //       text: TextSpan(
                //           text: 'Report ',
                //           style: kHead1Black,
                //           children: [
                //             TextSpan(text: 'Registration', style: kHead1Grey)
                //           ])),
                // ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: nameController,
                  hintText: 'Name',
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                LocationDropDownButton(
                    selectedLocation: selectedLocation,
                    location: location,
                    hintText: 'Location'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: dateController,
                  onTapPrefixIcon: () => showDate(context),
                  hintText: 'Date',
                  prefixIcon: Icons.date_range,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: categoryController,
                  hintText: 'Category',
                  prefixIcon: Icons.category,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: detailsController,
                  hintText: 'Details',
                  prefixIcon: Icons.details,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                FittedBox(
                  child: Row(
                    children: [
                      ReUsableContainer(
                        text: 'Upload Picture',
                        onTap: () =>
                            reportViewModel.pickImage(ImageSource.gallery),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      ReUsableContainer(
                        text: 'Upload Video',
                        onTap: () =>
                            reportViewModel.pickVideo(ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ConstantButton(
                    buttonText: 'Submit Data',
                    onTap: () {
                      if (nameController.text.isEmpty ||
                          selectedLocation.value.isEmpty ||
                          dateController.text.isEmpty ||
                          categoryController.text.isEmpty ||
                          detailsController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please fill all the fields');
                      } else {
                        reportViewModel.submitReport(
                            context,
                            nameController.text.trim(),
                            selectedLocation.value,
                            dateController.text.trim(),
                            categoryController.text.trim(),
                            detailsController.text.trim());
                      }
                    })
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
            color: const Color(0xFFF0E6FF),
            borderRadius: BorderRadius.circular(Get.width * 0.06),
            border: Border.all(color: kWhite, width: 2.w)),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload,
                color: kBlack,
                //   size: 30.r,
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                text,
                style: kBody2Black,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
