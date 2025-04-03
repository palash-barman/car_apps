import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../notification/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool engineOn = true;
  bool doorOpen = false;
  bool gpsOn = true;
  bool acOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            SizedBox(height: 20.h),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 0,
                    height: 0,
                    margin: EdgeInsets.only(top: 200.h),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha((0.1 * 255).toInt()),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff9291CF),
                          spreadRadius: 100,
                          blurRadius: 300,
                          offset: Offset(
                            0,
                            4,
                          ), // Horizontal and Vertical offset
                        ),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Image.asset("assets/images/car.png", height: 407.h),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Wrap(
                spacing: 16.w,
                runSpacing: 16.w,
                children: [
                  DeviceToggleCard(
                    title: 'Engine',
                    isOn: engineOn,
                    statusText: engineOn ? 'ON' : 'OFF',
                    backgroundColor:
                        engineOn
                            ? Get.theme.primaryColor
                            : Get.theme.primaryColor.withAlpha(
                              (0.08 * 255).toInt(),
                            ),
                    toggleColor:
                        engineOn ? Colors.white : Get.theme.primaryColor,
                    onChanged: (val) => setState(() => engineOn = val),
                  ),
                  DeviceToggleCard(
                    title: 'Door',
                    isOn: doorOpen,
                    statusText: doorOpen ? 'OPEN' : 'CLOSE',
                    backgroundColor:
                        doorOpen
                            ? Get.theme.primaryColor
                            : Get.theme.primaryColor.withAlpha(
                              (0.08 * 255).toInt(),
                            ),
                    onChanged: (val) => setState(() => doorOpen = val),
                    toggleColor:
                        doorOpen ? Colors.white : Get.theme.primaryColor,
                  ),
                  DeviceToggleCard(
                    title: 'GPS Tracking',
                    isOn: gpsOn,
                    statusText: gpsOn ? 'ON' : 'OFF',
                    backgroundColor:
                        gpsOn
                            ? Get.theme.primaryColor
                            : const Color(
                              0xFFE65D00,
                            ).withAlpha((0.08 * 255).toInt()),
                    toggleColor: gpsOn ? Colors.white : Get.theme.primaryColor,
                    onChanged: (val) => setState(() => gpsOn = val),
                  ),
                  DeviceToggleCard(
                    title: 'AC',
                    isOn: acOn,
                    statusText: acOn ? 'ON' : 'OFF',
                    backgroundColor:
                        acOn
                            ? Get.theme.primaryColor
                            : const Color(
                              0xFFE65D00,
                            ).withAlpha((0.08 * 255).toInt()),
                    toggleColor: acOn ? Colors.white : Get.theme.primaryColor,
                    onChanged: (val) => setState(() => acOn = val),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              "Hey🎉",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Johan Smith",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => NotificationScreen());
          },
          child: Container(
            height: 48.w,
            width: 48.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha((0.1 * 255).toInt()),
            ),
            child: SvgPicture.asset(
              "assets/images/notification_icon.svg",
              height: 24.w,
              width: 24.w,
            ),
          ),
        ),
        SizedBox(width: 12.w),

        Container(
          height: 48.w,
          width: 48.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withAlpha((0.1 * 255).toInt()),
          ),
          child: Image.asset("assets/images/img_1.png", fit: BoxFit.cover),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}

class DeviceToggleCard extends StatelessWidget {
  final String title;
  final bool isOn;
  final ValueChanged<bool> onChanged;
  final Color backgroundColor;
  final Color textColor;
  final Color toggleColor;
  final String statusText;

  const DeviceToggleCard({
    super.key,
    required this.title,
    required this.isOn,
    required this.toggleColor,
    required this.onChanged,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.statusText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 72.sp,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha((0.05 * 255).toInt()),
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                statusText,
                style: TextStyle(color: textColor, fontSize: 14.sp),
              ),
            ],
          ),
          // Toggle switch
          GestureDetector(
            onTap: () => onChanged(!isOn),
            child: Container(
              width: 28.h,
              height: 56.h,
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                border: Border.all(color: toggleColor, width: 2),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Align(
                alignment: isOn ? Alignment.topCenter : Alignment.bottomCenter,
                child: Container(
                  width: 14.h,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: toggleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
