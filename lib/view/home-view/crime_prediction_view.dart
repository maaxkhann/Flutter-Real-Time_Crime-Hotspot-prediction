import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class CrimePredictionView extends StatefulWidget {
  const CrimePredictionView({Key? key}) : super(key: key);

  @override
  State<CrimePredictionView> createState() => _CrimePredictionViewState();
}

class _CrimePredictionViewState extends State<CrimePredictionView> {
  // Initialize dataMap with initial values
  Map<String, double> dataMap = {
    "Location A": 30,
    "Location B": 20,
    "Location C": 50,
  };

  // Color list for pie chart segments
  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Crime Prediction'),
        body: Padding(
          padding: EdgeInsets.only(top: Get.height * 0.15),
          child: Column(
            children: [
              // PieChart with dataMap and colorList
              PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(seconds: 2),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                  decimalPlaces: 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
