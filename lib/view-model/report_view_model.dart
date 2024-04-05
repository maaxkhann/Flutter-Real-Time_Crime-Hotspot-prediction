import 'dart:convert';

import 'package:crime_management_system/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ReportViewModel extends ChangeNotifier {
  void addCrimeReport(String name, String cnic, String category,
      String location, String date, String time) async {
    EasyLoading.show(status: 'loading...');
    try {
      Map<String, dynamic> requestBody = {
        'reporter_name': name,
        'reporter_cnic': cnic,
        'crime_category': category,
        'crime_location': location,
        'report_date': date,
        'incident_time': time
      };

      String jsonBody = jsonEncode(requestBody);

      var response = await post(
          Uri.parse('http://13.126.116.79/api/v1/reports'),
          body: jsonBody,
          headers: {
            'Content-Type': 'application/json',
          });

      if (response.statusCode == 200) {
        EasyLoading.dismiss();

        Fluttertoast.showToast(msg: 'Report Submitted');

        LocalNotificationService.sendNotification(
            title: 'Alert', message: '$category in $location');
        Get.back();
      } else {
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    } catch (e) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: 'Something went wrong');
      rethrow;
    }
  }
}
