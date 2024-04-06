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
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegistrationFormView extends StatefulWidget {
  const RegistrationFormView({super.key});

  @override
  State<RegistrationFormView> createState() => _RegistrationFormViewState();
}

class _RegistrationFormViewState extends State<RegistrationFormView> {
  List<String> location = [
    'khanna',
    'koral',
    'kirpa',
    'humak',
    'lohi bher',
    'pliugran',
    'barakahu',
    'shehzad town',
    'bani gala',
    'nilore',
    'sihala',
    'g-6',
    'g-7',
    'g-8',
    'g-9',
    'g-10',
    'g-11',
    'g-12',
    'g-13',
    'g-14',
    'g-16',
    'f-6',
    'f-7',
    'f-8',
    'f-9',
    'f-10',
    'f-11',
    'f-12',
    'f-13',
    'f-17',
    'e-7',
    'e-8',
    'e-9',
    'e-16',
    'd-12',
    'd-16',
    'd-17',
    'i-8',
    'i-9',
    'i-10',
    'i-11',
    'i-14',
    'i-15',
    'i-16',
    'c-15',
    'c-16',
    'c-17',
    'h-8',
    'h-9',
    'h-10',
    'h-11',
    'h-12',
    'h-13',
    'b-17'
  ];
  List<String> time = ['morning', 'afternoon', 'evening', 'night'];
  List<String> category = [
    'domestic violence(spousal abuse)',
    'domestic violence(child abuse)',
    'traffic violations(hit and run)',
    'kidnapping',
    'robbery(property)',
    'robbery(car)',
    'robbery(motorcycle)',
    'robbery(cash)',
    'attempt murder',
    'murder',
    'snatching',
    'rape',
    'harrasment',
    'assault',
    'drug trafficking',
    'drug possession',
    'honor killing',
    'burglary',
    'fraud',
    'reckless driving',
  ];
  final ValueNotifier<String> selectedLocation = ValueNotifier<String>('');
  final ValueNotifier<String> selectedCategory = ValueNotifier<String>('');
  final ValueNotifier<String> selectedTime = ValueNotifier<String>('');
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();

  void showDate(context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024, 2),
        lastDate: DateTime(2050, 12),
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
        final formattedDate = DateFormat('M/dd/yyyy').format(selectedDate);
        dateController.text = formattedDate;
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    cnicController.dispose();
    selectedLocation.dispose();
    selectedCategory.dispose();
    dateController.dispose();
    selectedTime.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReportViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Report Registration'),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstantTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                    prefixIcon: Icons.person),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                    controller: cnicController,
                    hintText: 'CNIC',
                    prefixIcon: Icons.numbers),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: dateController,
                  onTapPrefixIcon: () => showDate(context),
                  hintText: 'Crime Date (m/dd/yyyy)',
                  prefixIcon: Icons.date_range,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedTime,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Crime Incident Time',
                          style: kBody2Black,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 28.r,
                          color: kBlack,
                        ),
                        isExpanded: true,
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.night_shelter,
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
                        items: time.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: FittedBox(
                                child: Text(
                                  value,
                                  style: kBody1Black,
                                ),
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedTime.value = value ?? '';
                        });
                  },
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
                        isExpanded: true,
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
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  value,
                                  style: kBody1Black,
                                ),
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
                        isExpanded: true,
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
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  value,
                                  style: kBody1Black,
                                ),
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedCategory.value = value ?? '';
                        });
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: ConstantButton(
              buttonText: 'Submit Data',
              onTap: () {
                if (nameController.text.isEmpty ||
                    cnicController.text.isEmpty ||
                    selectedLocation.value.isEmpty ||
                    dateController.text.isEmpty ||
                    selectedTime.value.isEmpty ||
                    selectedCategory.value.isEmpty) {
                  Fluttertoast.showToast(msg: 'Please enter all detail');
                } else {
                  provider.addCrimeReport(
                    nameController.text.trim(),
                    cnicController.text.trim(),
                    selectedCategory.value,
                    selectedLocation.value,
                    dateController.text.trim(),
                    selectedTime.value,
                  );
                }
              }),
        ),
      ),
    );
  }
}
