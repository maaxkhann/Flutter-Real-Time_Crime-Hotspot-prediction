import 'package:crime_management_system/view/auth-view/forgot_password_view.dart';
import 'package:crime_management_system/view/auth-view/signup_view.dart';
import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/bottom_nav_bar.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Login'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // Center(
                //   child: RichText(
                //       textAlign: TextAlign.center,
                //       text: TextSpan(
                //           text: 'Real-time ',
                //           style: kHead1Black,
                //           children: [
                //             TextSpan(
                //                 text: 'Crime Hotspot Prediction',
                //                 style: kHead1Grey)
                //           ])),
                // ),

                SizedBox(
                  height: Get.height * 0.1,
                ),

                const ConstantTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                ValueListenableBuilder(
                    valueListenable: isPasswordVisible,
                    builder: (ctx, value, child) {
                      return ConstantTextField(
                        hintText: 'Password',
                        obscureText: !isPasswordVisible.value,
                        prefixIcon: Icons.lock,
                        suffixIcon: value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTapSuffixIcon: () {
                          isPasswordVisible.value = !isPasswordVisible.value;
                        },
                      );
                    }),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.to(() => const ForgotPasswordView()),
                    child: Text(
                      'Forgot password?',
                      style: kBody3Transparent,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                ConstantButton(
                    buttonText: 'Login',
                    onTap: () =>
                        Get.to(() => const BottomNavigationBarWidget())),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New user?',
                      style: kBody2Black,
                    ),
                    TextButton(
                      onPressed: () => Get.to(() => const SignUpView()),
                      child: Text(
                        'Register now',
                        style: kBody2Transparent,
                      ),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: Get.width * 0.02,
                        thickness: 0.5,
                        color: kBlack,
                      ),
                    ),
                    Text(
                      'OR',
                      style: kBody3Black,
                    ),
                    Expanded(
                      child: Divider(
                        indent: Get.width * 0.02,
                        thickness: 0.5,
                        color: kBlack,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: Text(
                    'Sign In using',
                    style: kBody3Black,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Center(child: Image.asset('assets/images/google.png')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
