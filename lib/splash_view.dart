import 'dart:async';

import 'package:crime_management_system/constant-widgets/bottom_nav_bar.dart';
import 'package:crime_management_system/view/auth-view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool? isLoggedIn;
  Future isLogin() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  @override
  void initState() {
    super.initState();
    isLogin();
    Timer(
        const Duration(seconds: 2),
        () => Get.off(() => isLoggedIn == true
            ? BottomNavigationBarWidget()
            : const LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/icon.jpg',
      )),
    ));
  }
}
