import 'package:car_apps/View/base/custom_button.dart';
import 'package:car_apps/View/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_vehicles.dart';

class Vehicles extends StatefulWidget {
  const Vehicles({super.key});

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  @override
  Widget build(BuildContext context) {
    var modelList = [
      {
        "image": "assets/images/honda.png",
        "model": "Honda Civic 2018",
        "year": "2018",
        "vin": "Honda Civic 2018",
      },
      {
        "image": "assets/images/bmw.png",
        "model": "BMW 440i 2018",
        "year": "2018",
        "vin": "BMW 440i 2018",
      },
      {
        "image": "assets/images/audi.png",
        "model": "Audi S5 2016",
        "year": "2018",
        "vin": "Toyota Rav 4 2022",
      },
      {
        "image": "assets/images/toyota.png",
        "model": "Toyota Rav 4 2022",
        "year": "2018",
        "vin": "Toyota Rav 4 2022",
      },
    ];
    var selectIndex = (-1);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Vehicles", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: modelList.length,
                itemBuilder: (context, index) {
                  var data = modelList[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                      Get.to(() => HomeScreen());
                    },
                    child: _buildCard(
                      data['image']!,
                      data['model'],
                      data['vin'],
                      selectIndex == index,
                      () {
                        // todo: Implement delete feature
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16);
                },
              ),
            ),
            CustomButton(
              label: "ADD NEW VEHICLE",
              onTap: () {
                Get.to(() => AddVehicles());
              },
            ),
            SizedBox(height: 34),
          ],
        ),
      ),
    );
  }

  _buildCard(
    String image,
    title,
    subTitle,
    bool isBorder,
    VoidCallback onDelete,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.05 * 255).toInt()),
        borderRadius: BorderRadius.circular(12),
        border: isBorder ? Border.all(color: Get.theme.primaryColor) : null,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Row(
        children: [
          Image.asset(image, height: 80, width: 100, fit: BoxFit.fill),
          Expanded(
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: TextStyle(color: Color(0xffCDCDCD), fontSize: 12),
              ),
              trailing: InkWell(
                onTap: onDelete,
                child: Icon(Icons.delete, color: Get.theme.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
