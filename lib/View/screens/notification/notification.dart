import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var notificationList = [
      {
        "image": "assets/images/n1.svg",
        "title": "Climate has been turned on",
        "content": "The interior temperature will reach 72 F.",
      },
      {
        "image": "assets/images/n2.svg",
        "title": "Doors Locked Successfully",
        "content": "All doors are now locked. Drive safe.",
      },
      {
        "image": "assets/images/n3.svg",
        "title": "Vehicle Started Remotely",
        "content": "Engine ignition successful. Climate control active.",
      },
      {
        "image": "assets/images/n4.svg",
        "title": "Low Fuel Warning",
        "content": "Fuel level is at 12%. Navigate to nearest station?",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          var data = notificationList[index];
          return _buildCard(data['image']!, data['title'], data['content']);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16);
        },
      ),
    );
  }

  _buildCard(String image, title, subTitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.05 * 255).toInt()),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.primaryColor,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              image,
              height: 24,
              width: 24,
              fit: BoxFit.fill,
            ),
          ),

          Expanded(
            child: ListTile(
              title: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                subTitle,
                style: TextStyle(color: Color(0xffCCCCCC), fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
