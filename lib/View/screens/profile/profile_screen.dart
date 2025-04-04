import 'package:car_apps/View/base/custom_button.dart';
import 'package:car_apps/View/screens/auth/sign_in_screen.dart';
import 'package:car_apps/View/screens/profile/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.chevron_left, size: 24),
        ),
        title: Text(
          "PROFILE",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h), // Top padding
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
            SizedBox(height: 15.h), // Space between image and name
            // User Name
            Text(
              'Samuel Nguyen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp, // Font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h), // Space between name and menu items
            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    onTap: () => Get.to(() => PersonalInfoScreen()),
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.description_outlined,
                    title: 'Terms of Service',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.security_outlined,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.info_outline,
                    title: 'About Us',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,

                            content: Text(
                              'Are you sure you want to logout?',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            actions: [
                              Row(
                                spacing: 16.w,
                                children: [
                                  Flexible(
                                    child: CustomButton(
                                      color: Get.theme.scaffoldBackgroundColor,
                                      label: "Logout",
                                      onTap: () {
                                        Get.to(() => SignInScreen());
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    child: CustomButton(
                                      label: "Cancel",
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
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

  // Helper method to build each menu item
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24.w, // Icon size
            ),
            SizedBox(width: 15.w), // Space between icon and text
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp, // Font size
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the divider
  Widget _buildDivider() {
    return Divider(
      color: Colors.white.withAlpha(
        (0.5 * 255).toInt(),
      ), // Semi-transparent white
      thickness: 1.h,
    );
  }
}
