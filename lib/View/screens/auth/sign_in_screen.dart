import 'package:car_apps/View/screens/auth/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base/custom_button.dart';
import '../../base/custom_text_field.dart';
import '../vehicles/vehicles.dart';
import 'fogot_password.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final Color textColor = Colors.white;
  final Color accentColor = Color(0xffE65D00);

  var isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.25),
            Text(
              "Log in",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(label: "Email"),
            const SizedBox(height: 16),
            CustomTextField(label: "Password", isPassword: true),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (val) {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      activeColor: accentColor,
                    ),
                    Text("Remember me?", style: TextStyle(color: textColor)),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: "LOG IN",
              onTap: () {
                Get.to(() => Vehicles());
              },
            ),
            SizedBox(height: 40),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "I don’t have an account?",
                  children: [
                    TextSpan(
                      text: " REGISTER NOW",
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => SignUpScreen());
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


