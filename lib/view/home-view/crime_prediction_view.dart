import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/view-model/crime_prediction_view_model.dart';
import 'package:crime_management_system/view/home-view/crime_type_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class CrimePredictionView extends StatefulWidget {
  const CrimePredictionView({Key? key}) : super(key: key);

  @override
  State<CrimePredictionView> createState() => _CrimePredictionViewState();
}

class _CrimePredictionViewState extends State<CrimePredictionView> {
  TextEditingController dateController = TextEditingController();
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

  final ValueNotifier<String> selectedLocation = ValueNotifier<String>('');

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
    dateController.dispose();
    selectedLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<CrimePredictionViewModel>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Crime Prediction'),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.1, vertical: Get.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                ConstantTextField(
                  controller: dateController,
                  onTapPrefixIcon: () => showDate(context),
                  hintText: 'Date',
                  prefixIcon: Icons.date_range,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedLocation.value.isEmpty ||
                        dateController.text.isEmpty) {
                      Get.snackbar(
                          colorText: kWhite,
                          'Message',
                          'Select location and date for prediction',
                          isDismissible: true,
                          dismissDirection: DismissDirection.startToEnd);
                    } else {
                      provider.getPrediction(
                          selectedLocation.value, dateController.text.trim());
                    }
                  },
                  child: const Text('Predict'),
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                selectedLocation.value.isNotEmpty ||
                        dateController.text.isNotEmpty
                    ? provider.isLoading
                        ? const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: SpinKitCircle(
                              color: kBlack,
                            ),
                          )
                        : PieChart(
                            dataMap: {
                              'Safe': 1 - provider.prediction,
                              'Crime': provider.prediction,
                            },
                            animationDuration: const Duration(seconds: 2),
                            chartLegendSpacing: 32,
                            chartRadius: MediaQuery.of(context).size.width / 2,
                            //    baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                            colorList: const [
                              Color(0xff4285f4), // Color for the 30%
                              Colors.red, // Transparent color for the 70%
                            ],
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            ringStrokeWidth: 0, // Fill the entire circle
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.right,
                              showLegends: provider.prediction != null
                                  ? true
                                  : false, // Hide the legend
                              legendShape: BoxShape.circle,
                              legendTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: true,
                              showChartValuesOutside: false,
                              decimalPlaces: 4,
                            ),
                            totalValue: 1,
                          )
                    : const SizedBox()
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: ConstantButton(
              buttonText: 'Search With Type',
              onTap: () => Get.to(() => const CrimeTypeView())),
        ),
      ),
    );
  }
}
