import 'dart:async';

import 'package:crime_management_system/auth-view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () => Get.off(() => const LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/logo.jpg',
        width: double.infinity,
        height: Get.height * 1,
        fit: BoxFit.fill,
      )),
    ));
  }
}
