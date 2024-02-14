import 'package:crime_management_system/auth-view/login_view.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
    ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
    ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: ListView(
            children: [
              // SizedBox(
              //   height: Get.height * 0.02,
              // ),
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
                height: Get.height * 0.02,
              ),
              Text(
                'Sign Up',
                style: kHead2Black,
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              Text(
                'Name',
                style: kBody1Black,
              ),
              const ConstantTextField(
                hintText: 'Name',
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: Get.height * 0.02,
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
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                'Confirm Password',
                style: kBody1Black,
              ),
              ValueListenableBuilder(
                  valueListenable: isConfirmPasswordVisible,
                  builder: (ctx, value, child) {
                    return ConstantTextField(
                      hintText: 'Confirm Password',
                      obscureText: !isConfirmPasswordVisible.value,
                      prefixIcon: Icons.lock,
                      suffixIcon: value == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTapSuffixIcon: () {
                        isConfirmPasswordVisible.value =
                            !isConfirmPasswordVisible.value;
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
              //   ],
              // ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              ConstantButton(buttonText: 'Sign Up', onTap: () {}),

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
                    'Already have an account?',
                    style: kBody2Black,
                  ),
                  TextButton(
                      onPressed: () => Get.off(() => const LoginView()),
                      child: Text(
                        'Login',
                        style: kBody2Transparent,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
