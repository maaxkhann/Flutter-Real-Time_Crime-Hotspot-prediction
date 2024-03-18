import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class CrimeRateView extends StatelessWidget {
  const CrimeRateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Crime Rate'),
        body: Center(
          child: Container(
            height: Get.height * 0.5,
            padding: const EdgeInsets.all(20.0),
            child: CrimeChart(),
          ),
        ),
      ),
    );
  }
}

class CrimeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CrimeData> chartData = [
      CrimeData('Location A', Random().nextInt(50) + 20),
      CrimeData('Location B', Random().nextInt(50) + 20),
      CrimeData('Location C', Random().nextInt(50) + 20),
      CrimeData('Location D', Random().nextInt(50) + 20),
      CrimeData('Location E', Random().nextInt(50) + 20),
    ];

    int totalCount =
        chartData.map((data) => data.count).reduce((a, b) => a + b);
    double averageCount = totalCount / chartData.length;

    List<CrimeData> percentageData = chartData
        .map((data) =>
            CrimeData(data.week, (data.count / totalCount * 100).round()))
        .toList();

    double sumX = 0;
    double sumY = 0;
    double sumXY = 0;
    double sumXSquare = 0;
    for (int i = 0; i < chartData.length; i++) {
      sumX += i + 1;
      sumY += percentageData[i].count;
      sumXY += (i + 1) * percentageData[i].count;
      sumXSquare += pow(i + 1, 2);
    }

    double n = chartData.length.toDouble();
    double slope = (n * sumXY - sumX * sumY) / (n * sumXSquare - pow(sumX, 2));
    double intercept = (sumY - slope * sumX) / n;

    List<CrimeData> predictedData = [];
    for (int i = 1; i <= 12; i++) {
      double predictedPercentage = slope * (chartData.length + i) + intercept;
      predictedData.add(CrimeData('Location F', predictedPercentage.round()));
    }

    return Column(
      children: [
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: [
              ColumnSeries<CrimeData, String>(
                dataSource: percentageData,
                xValueMapper: (CrimeData crime, _) => crime.week,
                yValueMapper: (CrimeData crime, _) => crime.count.toDouble(),
                pointColorMapper: (CrimeData crime, _) {
                  if (crime.count < averageCount) {
                    return Colors.green; // Less crime
                  } else if (crime.count > averageCount) {
                    return Colors.red; // More crime
                  } else {
                    return Colors.orange; // Average crime
                  }
                },
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                ),
              ),
            ],
            tooltipBehavior: TooltipBehavior(
              enable: true,
              format: 'point.x : point.y%',
            ),
          ),
        ),
      ],
    );
  }
}

class CrimeData {
  final String week;
  final int count;

  CrimeData(this.week, this.count);
}
