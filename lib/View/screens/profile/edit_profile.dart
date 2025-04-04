import 'dart:io';

import 'package:car_apps/View/base/custom_button.dart';
import 'package:car_apps/View/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile; // Variable to store the selected image file

  Future imagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      setState(() {
        imageFile = File(image.path); // Store the selected image file
      });
    } else {
      debugPrint('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.chevron_left, size: 24),
        ),
        title: Text(
          "EDIT PROFILE",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50), // Space between title and profile picture
            // Profile Picture
            GestureDetector(
              onTap: () {
                imagePicker(); // Open image picker on tap
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 62, // 100x100 pixels
                    backgroundColor: Colors.white, // White border
                    child: CircleAvatar(
                      radius: 62, // Slightly smaller to show the border
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withAlpha(
                            (0.3 * 255).toInt(),
                          ), // Adjust brightness
                          BlendMode.darken,
                        ),
                        child:
                            imageFile != null
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                    width: 115.w,
                                    height: 115.h,
                                  ),
                                )
                                : Image.asset(
                                  'assets/images/img_1.png',
                                  fit: BoxFit.cover,
                                  height: 115.h,
                                  width: 115.w,
                                ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 15, // Size of the edit icon
                      backgroundColor:
                          Colors.transparent, // Background color of the icon
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 24, // Size of the edit icon
                        color: Colors.white, // Color of the icon
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            CustomTextField(label: "Name"),
            SizedBox(height: 32.h),
            CustomButton(label: "Save Changes", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
