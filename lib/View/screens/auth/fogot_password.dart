import 'package:car_apps/View/base/custom_button.dart';
import 'package:car_apps/View/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_text_field.dart';
import 'otp_verify.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height / 7),
            Text(
              "Forget Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please, enter your email address below to receive your user and a new password.",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 30),
            CustomTextField(label: "Email"),
            SizedBox(height: 30),
            CustomButton(
              label: "RESET PASSWORD",
              onTap: () {
                Get.to(() => VerificationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
