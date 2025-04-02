import 'package:car_apps/View/screens/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash_background.png",
            fit: BoxFit.fill,
            height: Get.height,
            width: Get.width,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Unleash the next evolution in car home",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 64),

                CustomButton(label: "GET STARTED", onTap: () {

                  Get.to(()=>SignInScreen());

                }),
                SizedBox(height: 64),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

