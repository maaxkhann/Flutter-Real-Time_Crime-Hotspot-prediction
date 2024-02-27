import 'package:crime_management_system/view-model/auth_view_model.dart';
import 'package:crime_management_system/view/auth-view/login_view.dart';
import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'SignUp'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.r,
                  child: Image.asset(
                    'assets/images/icon.jpg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              ConstantTextField(
                  controller: nameController,
                  hintText: 'Name',
                  prefixIcon: Icons.person),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ConstantTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ValueListenableBuilder(
                  valueListenable: isPasswordVisible,
                  builder: (ctx, value, child) {
                    return ConstantTextField(
                      controller: passwordController,
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
              ValueListenableBuilder(
                  valueListenable: isConfirmPasswordVisible,
                  builder: (ctx, value, child) {
                    return ConstantTextField(
                      controller: confirmPasswordController,
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
              SizedBox(
                height: Get.height * 0.05,
              ),
              ConstantButton(
                  buttonText: 'Sign Up',
                  onTap: () {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Please fill all the fields');
                      return;
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      Fluttertoast.showToast(msg: 'Password not matched');
                      return;
                    } else {
                      authViewModel.createUser(
                          context,
                          nameController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim());
                    }
                  }),
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
                      )),
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
    );
  }
}
