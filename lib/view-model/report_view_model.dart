import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class ReportViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  File? image;
  File? video;
  final picker = ImagePicker();
  bool isUpload = false;

  Future pickImage(ImageSource source) async {
    XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      Fluttertoast.showToast(msg: 'Image selected');
      image = File(pickedFile.path);
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'No image selected');
    }
  }

  Future pickVideo(ImageSource source) async {
    XFile? pickedFile = await picker.pickVideo(source: source);
    if (pickedFile != null) {
      Fluttertoast.showToast(msg: 'Video selected');
      video = File(pickedFile.path);
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'No video selected');
    }
  }

  // Future storeMedia(File media, String mediaType) async {
  //   isUpload = true;
  //   notifyListeners();
  //   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //   try {
  //     Reference storageRef = firebaseStorage
  //         .ref()
  //         .child('$mediaType/${DateTime.now().millisecondsSinceEpoch}');
  //     UploadTask uploadTask = storageRef.putFile(media);
  //     await Future.value(uploadTask);
  //     var newUrl = await storageRef.getDownloadURL();

  //     DocumentReference userRef =
  //         firestore.collection('Users').doc(auth.currentUser!.uid);
  //     await userRef.update({'$mediaType': newUrl.toString()});
  //     Fluttertoast.showToast(
  //         msg: '${mediaType == 'images' ? 'Image' : 'Video'} Uploaded');
  //     isUpload = false;
  //     notifyListeners();
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: 'Something went wrong');
  //     isUpload = false;
  //     notifyListeners();
  //     rethrow;
  //   }
  // }

  Future<void> submitReport(BuildContext context, String name, String location,
      String dateTime, String category, String details) async {
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

      String? imageUrl;
      String? videoUrl;
      if (image != null) {
        imageUrl = await storeMediaAndGetUrl(image!, 'images');
      }
      if (video != null) {
        videoUrl = await storeMediaAndGetUrl(video!, 'videos');
      }

      await reportReference.set({
        'name': name,
        'location': location,
        'dateTime': dateTime,
        'category': category,
        'details': details,
        'imageUrl': imageUrl,
        'videoUrl': videoUrl,
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

  Future<String> storeMediaAndGetUrl(File media, String mediaType) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageRef = firebaseStorage
        .ref()
        .child('$mediaType/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = storageRef.putFile(media);
    await uploadTask;
    var newUrl = await storageRef.getDownloadURL();
    return newUrl.toString();
  }
}
