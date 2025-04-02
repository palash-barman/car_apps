import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'View/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            primarySwatch: Colors.red,
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xff141414),
                titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
                iconTheme: IconThemeData(
                    color: Colors.white
                )
            ),
            primaryColor: Color(0xffE65D00),
            scaffoldBackgroundColor: Color(0xff141414),
            textTheme: GoogleFonts.robotoTextTheme(),
          ),
          home:  SplashScreen(),
        );
      },

    );



    return ScreenUtilInit(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff141414),
            titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
            iconTheme: IconThemeData(
              color: Colors.white
            )
          ),
          primaryColor: Color(0xffE65D00),
          scaffoldBackgroundColor: Color(0xff141414),
          textTheme: GoogleFonts.robotoTextTheme(),
      
        ),
        home:  SplashScreen(),
      ),
    );
  }
}
