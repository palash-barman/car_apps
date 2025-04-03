import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_button.dart';
import '../../base/custom_text_field.dart';

class AddVehicles extends StatelessWidget {
  const AddVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add vehicles'),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Get.theme.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Get.theme.primaryColor,
            unselectedLabelColor: Get.theme.primaryColor.withAlpha(
              (0.7 * 255).toInt(),
            ),
            tabs: [Tab(text: "Manual Input"), Tab(text: "With VIN")],
          ),
        ),
        body: TabBarView(children: [_manualInput(), _withVIN()]),
      ),
    );
  }

  Widget _manualInput() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height * 0.11),
          CustomTextField(label: "Make"),
          const SizedBox(height: 16),
          CustomTextField(label: "Model"),
          const SizedBox(height: 16),
          CustomTextField(label: "Year"),
          const SizedBox(height: 48),
          CustomButton(
            label: "ADD VEHICLES",
            onTap: () {
              Get.back();
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _withVIN() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(label: "VIN"),
          const SizedBox(height: 48),
          CustomButton(
            label: "ADD VEHICLES",
            onTap: () {
              Get.back();
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
