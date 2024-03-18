import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class ReportViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> submitReport(
      BuildContext context,
      String location,
      String sector,
      String date,
      String crimeType,
      String weather,
      String dayNight,
      String age,
      String gender,
      String arrested,
      String crimeRate) async {
    ProgressDialog progressDialog = ProgressDialog(context,
        title: const Text('Submitting Data'),
        message: const Text('Please wait'));
    progressDialog.show();
    try {
      DocumentReference reportReference = firestore
          .collection('Crime Data')
          .doc(auth.currentUser!.uid)
          .collection('Reports')
          .doc();

      await reportReference.set({
        'location': location,
        'sector': sector,
        'date': date,
        'crimeType': crimeType,
        'weather': weather,
        'dayNight': dayNight,
        'arrested': arrested,
        'gender': gender,
        'suspectAge': age,
        'crimeRate': crimeRate,
        'userId': auth.currentUser!.uid,
        'reportId': reportReference.id
      });
      Fluttertoast.showToast(msg: 'Report Submitted');
      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
