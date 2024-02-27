import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LocationDropDownButton extends StatelessWidget {
  final List<String> location;
  final ValueNotifier<String> selectedLocation;
  final String hintText;
  const LocationDropDownButton({
    super.key,
    required this.location,
    required this.selectedLocation,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedLocation,
      builder: (context, value, child) {
        return DropdownButtonFormField<String>(
            dropdownColor: const Color(0xFFF0E6FF),
            hint: Text(
              hintText,
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
                  Icons.location_on,
                  color: kBlack,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kWhite, width: 2.w),
                    borderRadius: BorderRadius.circular(Get.width * 0.1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kWhite, width: 2.w),
                    borderRadius: BorderRadius.circular(Get.width * 0.1))),
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
    );
  }
}
