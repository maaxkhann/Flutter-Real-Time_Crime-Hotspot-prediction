import 'package:crime_management_system/auth-view/signup_view.dart';
import 'package:crime_management_system/constant-widgets/bottom_nav_bar.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/home-view/home_view.dart';
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Real-time ',
                          style: kHead1Black,
                          children: [
                            TextSpan(
                                text: 'Crime Hotspot Prediction',
                                style: kHead1Grey)
                          ])),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Login',
                  style: kHead2Black,
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Text(
                  'Email',
                  style: kBody1Black,
                ),
                const ConstantTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  'Password',
                  style: kBody1Black,
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
                // Row(
                //   children: [
                //     ValueListenableBuilder(
                //         valueListenable: isChecked,
                //         builder: ((context, value, child) {
                //           return Checkbox(
                //               value: isChecked.value,
                //               onChanged: (value) {
                //                 isChecked.value = value!;
                //               });
                //         })),
                //     Text(
                //       'Remember me',
                //       style: kBody4Dark,
                //     ),
                //     const Spacer(),
                //     TextButton(
                //       onPressed: () => Get.to(() => const ForgotPasswordView()),
                //       child: Text(
                //         'Forgot password?',
                //         style: kBody4Dark,
                //       ),
                //     )
                //   ],
                // ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                ConstantButton(
                    buttonText: 'Login',
                    onTap: () =>
                        Get.to(() => const BottomNavigationBarWidget())),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         endIndent: Get.width * 0.02,
                //         thickness: 0.5,
                //         color: kBlack,
                //       ),
                //     ),
                //     Text(
                //       'OR',
                //       style: kBody3Black,
                //     ),
                //     Expanded(
                //       child: Divider(
                //         indent: Get.width * 0.02,
                //         thickness: 0.5,
                //         color: kBlack,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: Get.height * 0.02,
                // ),
                // Center(
                //   child: Text(
                //     'Sign In using',
                //     style: kBody3Black,
                //   ),
                // ),
                // SizedBox(
                //   height: Get.height * 0.01,
                // ),
                // Center(child: Image.asset('assets/images/google.png')),

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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
