import 'package:car_apps/View/base/custom_button.dart';
import 'package:car_apps/View/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_text_field.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.10),
            Text(
              "Create New Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Create your new password. If you forget it then you have to do forgot password.",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 30),
            CustomTextField(label: "New password", isPassword: true),
            SizedBox(height: 16),
            CustomTextField(label: "Confirm password", isPassword: true),
            SizedBox(height: 48),
            CustomButton(
              label: "Submit",
              onTap: () {
                Get.offAll(() => SignInScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
