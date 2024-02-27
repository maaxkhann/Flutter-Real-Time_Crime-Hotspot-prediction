import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/constant_button.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/view-model/auth_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _LoginViewState();
}

class _LoginViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Forgot Password'),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04, vertical: Get.height * 0.1),
          child: Column(
            children: [
              ConstantTextField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              ConstantButton(
                  buttonText: 'Submit',
                  onTap: () {
                    if (emailController.text.isNotEmpty) {
                      provider.resetPassword(emailController.text.trim());
                    } else {
                      Fluttertoast.showToast(msg: 'Please enter correct email');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
