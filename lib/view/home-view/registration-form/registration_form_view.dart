import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/view-model/report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class RegistrationFormView extends StatefulWidget {
  const RegistrationFormView({super.key});

  @override
  State<RegistrationFormView> createState() => _RegistrationFormViewState();
}

class _RegistrationFormViewState extends State<RegistrationFormView> {
  List<String> location = ['G Sector', 'E Sector', 'I Sector', 'F Sector'];
  List<String> category = [
    'Assault',
    'Burglary',
    'Kidnap'
        'Theft',
    'Vandalism',
    'Drug_Possession',
    'Robbery'
  ];
  final ValueNotifier<String> selectedLocation = ValueNotifier<String>('');
  final ValueNotifier<String> selectedCategory = ValueNotifier<String>('');
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void showDate(context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024, 2),
        lastDate: DateTime(2025, 12),
        builder: (context, picker) {
          return Theme(
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
      if (selectedDate != null) {
        final formattedDate = DateFormat('dd MM yyyy').format(selectedDate);
        dateController.text = formattedDate;
        print(dateController.text);
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    selectedLocation.dispose();
    selectedCategory.dispose();
    dateController.dispose();
    cnicController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reportViewModel =
        Provider.of<ReportViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Report Registration'),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.03, vertical: Get.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstantTextField(
                  controller: nameController,
                  hintText: 'Name',
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: cnicController,
                  hintText: 'CNIC',
                  prefixIcon: Icons.numbers,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedLocation,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Location',
                          style: kBody2Black,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 28.r,
                          color: kBlack,
                        ),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.location_pin,
                              color: kBlack,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kWhite, width: 2.w),
                                borderRadius:
                                    BorderRadius.circular(Get.width * 0.1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kWhite, width: 2.w),
                                borderRadius:
                                    BorderRadius.circular(Get.width * 0.1))),
                        value: value.isEmpty ? null : value,
                        items: location.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kBody1Black,
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedLocation.value = value ?? '';
                        });
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedCategory,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Category',
                          style: kBody2Black,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 28.r,
                          color: kBlack,
                        ),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.category,
                              color: kBlack,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kWhite, width: 2.w),
                                borderRadius:
                                    BorderRadius.circular(Get.width * 0.1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kWhite, width: 2.w),
                                borderRadius:
                                    BorderRadius.circular(Get.width * 0.1))),
                        value: value.isEmpty ? null : value,
                        items: category.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kBody1Black,
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedCategory.value = value ?? '';
                        });
                  },
                ),
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
                TextField(
                  controller: detailsController,
                  maxLines: null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.details),
                      fillColor: constantColor,
                      filled: true,
                      hintText: 'Details',
                      hintStyle: kBody2Black,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Get.width * 0.1),
                          borderSide: BorderSide.none),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Get.width * 0.1),
                          borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                FittedBox(
                  child: Row(
                    children: [
                      ReUsableContainer(
                        text: 'Upload Image',
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
                          selectedCategory.value.isEmpty ||
                          detailsController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please fill all the fields');
                      } else {
                        reportViewModel.submitReport(
                            context,
                            nameController.text.trim(),
                            selectedLocation.value,
                            dateController.text.trim(),
                            selectedCategory.value,
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        width: Get.width * 0.45,
        height: Get.height * 0.09,
        decoration: BoxDecoration(
          color: const Color(0xFFF0E6FF),
          borderRadius: BorderRadius.circular(Get.width * 0.06),
          border: Border.all(color: kWhite, width: 2.w),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload,
                color: kBlack,
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
