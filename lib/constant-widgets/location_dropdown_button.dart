import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationDropDownButton extends StatelessWidget {
  final List<String> location;
  final String hintText;
  const LocationDropDownButton({
    super.key,
    required this.location,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> selectedLocation = ValueNotifier<String>('');
    return ValueListenableBuilder(
      valueListenable: selectedLocation,
      builder: (context, value, child) {
        return DropdownButtonFormField<String>(
            hint: Text(hintText),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFA7A7A7)),
                    borderRadius: BorderRadius.circular(Get.width * 0.04)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFA7A7A7)),
                    borderRadius: BorderRadius.circular(Get.width * 0.04))),
            value: value.isEmpty ? null : value,
            items: location.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (String? value) {
              selectedLocation.value = value ?? '';
            });
      },
    );
  }
}
