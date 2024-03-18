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
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegistrationFormView extends StatefulWidget {
  const RegistrationFormView({super.key});

  @override
  State<RegistrationFormView> createState() => _RegistrationFormViewState();
}

class _RegistrationFormViewState extends State<RegistrationFormView> {
  List<String> weather = ['Sunny', 'Rain', 'Clear', 'Cloudy', 'Fog'];
  List<String> dayNight = ['Day', 'Night'];
  List<String> gender = ['Male', 'Female'];
  List<String> isArrested = ['Yes', 'No'];
  List<String> crimeType = [
    'Assault',
    'Burglary',
    'Theft',
    'Vandalism',
    'Drug_Possession',
    'Robbery'
  ];
  final ValueNotifier<String> selectedWeather = ValueNotifier<String>('');
  final ValueNotifier<String> selectedDayNight = ValueNotifier<String>('');
  final ValueNotifier<String> selectedgender = ValueNotifier<String>('');
  final ValueNotifier<String> selectedIsArrested = ValueNotifier<String>('');
  final ValueNotifier<String> selectedCrimeType = ValueNotifier<String>('');
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController crimeRateController = TextEditingController();

  void showDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
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
      },
    );

    if (selectedDate != null) {
      final formattedDate = DateFormat('dd MM yyyy').format(selectedDate);
      dateController.text = formattedDate;
      print(dateController.text);
    }
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
              horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstantTextField(
                  controller: locationController,
                  hintText: 'Location',
                  prefixIcon: Icons.location_pin,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: sectorController,
                  hintText: 'Sector',
                  prefixIcon: Icons.location_city,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedCrimeType,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Crime Type',
                          style: kBody2Black,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: kBlack,
                        ),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.type_specimen,
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
                        items: crimeType.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kBody1Black,
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedCrimeType.value = value ?? '';
                        });
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedWeather,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Weather',
                          style: kBody2Black,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: kBlack,
                        ),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.cloud_sync,
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
                        items: weather.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kBody1Black,
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedWeather.value = value ?? '';
                        });
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedDayNight,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Day/Night',
                          style: kBody2Black,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: kBlack,
                        ),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.sunny,
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
                        items: dayNight.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kBody1Black,
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedDayNight.value = value ?? '';
                        });
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantTextField(
                  controller: ageController,
                  hintText: 'Suspect Age',
                  prefixIcon: Icons.numbers,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedgender,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Male/Female',
                          style: kBody2Black,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: kBlack,
                        ),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.person,
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
                        items: gender.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kBody1Black,
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedgender.value = value ?? '';
                        });
                  },
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ValueListenableBuilder(
                  valueListenable: selectedIsArrested,
                  builder: (context, value, child) {
                    return DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFFF0E6FF),
                        hint: Text(
                          'Arrested/Not Arrested',
                          style: kBody2Black,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: kBlack,
                        ),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF0E6FF),
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.local_police,
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
                        items: isArrested.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: kBody1Black,
                              ));
                        }).toList(),
                        onChanged: (String? value) {
                          selectedIsArrested.value = value ?? '';
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
                ConstantTextField(
                  controller: crimeRateController,
                  hintText: 'Crime Rate',
                  prefixIcon: Icons.numbers,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConstantButton(
                    buttonText: 'Submit Data',
                    onTap: () {
                      if (locationController.text.isEmpty ||
                          sectorController.text.isEmpty ||
                          dateController.text.isEmpty ||
                          selectedCrimeType.value.isEmpty ||
                          ageController.text.isEmpty ||
                          selectedDayNight.value.isEmpty ||
                          selectedIsArrested.value.isEmpty ||
                          selectedWeather.value.isEmpty ||
                          selectedgender.value.isEmpty ||
                          crimeRateController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Please fill all the fields');
                      } else {
                        reportViewModel.submitReport(
                            context,
                            locationController.text.trim(),
                            sectorController.text.trim(),
                            dateController.text.trim(),
                            selectedCrimeType.value,
                            selectedWeather.value,
                            selectedDayNight.value,
                            ageController.text.trim(),
                            selectedgender.value,
                            selectedIsArrested.value,
                            crimeRateController.text.trim());
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
