import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Repository {
  void addCrimeReport(String name, String cnic, String date, String time,
      String location, String category) async {
    try {
      Response response = await post(
          Uri.parse('http://13.126.116.79/api/v1/reports'),
          headers: {
            'Content-Type': 'application/json'
          },
          body: {
            'reporter_name': name,
            'reporter_cnic': cnic,
            'crime_category': category,
            'crime_location': location,
            'report_date': date,
            'incident_time': time
          });
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Report Submitted');
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
      rethrow;
    }
  }
}
