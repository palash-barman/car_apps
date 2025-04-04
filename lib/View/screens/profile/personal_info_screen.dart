import 'package:car_apps/View/base/custom_button.dart';
import 'package:car_apps/View/screens/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.chevron_left, size: 24),
        ),
        title: Text(
          "PERSONAL INFORMATION",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.h), // Space between title and profile picture
            // Profile Picture
            CircleAvatar(
              radius: 50.w, // 100x100 pixels
              backgroundColor: Colors.white, // White border
              child: CircleAvatar(
                radius: 48.w, // Slightly smaller to show the border
                backgroundImage: const AssetImage(
                  'assets/images/img_1.png', // Placeholder image
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ), // Space between profile picture and Name section
            // Name and Email Sections
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name Section
                  Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp, // Font size
                    ),
                  ),
                  SizedBox(height: 10.h), // Space between label and box
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.w), // Padding inside the box
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF2A3435,
                      ), // Slightly lighter background
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ), // Rounded corners
                    ),
                    child: Text(
                      'Samuel Nguyen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp, // Font size
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ), // Space between Name and Email sections
                  // Email Section
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp, // Font size
                    ),
                  ),
                  SizedBox(height: 10.h), // Space between label and box
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.w), // Padding inside the box
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF2A3435,
                      ), // Slightly lighter background
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ), // Rounded corners
                    ),
                    child: Text(
                      'samuel@example.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp, // Font size
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ), // Space between Email section and button
                  // Edit Profile Button (Basic, no styling)
                  CustomButton(
                    label: "Edit Profile",
                    onTap: () {
                      Get.to(() => const EditProfile());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
