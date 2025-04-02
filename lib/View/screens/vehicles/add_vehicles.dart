import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_button.dart';
import '../../base/custom_text_field.dart';


class AddVehicles extends StatelessWidget {
  const AddVehicles({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text('Add vehicles'),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.11),
            CustomTextField(label: "Type Model"),
            const SizedBox(height: 16),
            CustomTextField(label: "Year"),
            const SizedBox(height: 16),
            CustomTextField(label: "VIN",),
            const SizedBox(height: 48),
            CustomButton(label: "ADD VEHICLES", onTap: () {
              Get.back();
            }),
            SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}
