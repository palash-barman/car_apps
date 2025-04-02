import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base/custom_button.dart';
import '../../base/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.11),
            Text(
              "Register",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(label: "Name"),
            const SizedBox(height: 16),
            CustomTextField(label: "Email"),
            const SizedBox(height: 16),
            CustomTextField(label: "Password", isPassword: true),
            const SizedBox(height: 48),
            CustomButton(label: "REGISTER NOW", onTap: () {
              Get.back();
            }),
            SizedBox(height: 40),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  children: [
                    TextSpan(
                      text: " LOG IN",
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


