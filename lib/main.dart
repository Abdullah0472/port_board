import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:port_board/res/routes/routes.dart';
import 'package:port_board/view/confirm/confirm_view.dart';
import 'package:port_board/view/login/login_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'res/colors/colors.dart';
import 'view/slider/slider_view.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColor.applicationColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 480, name: MOBILE),
              const Breakpoint(start: 481, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
      defaultTransition: Transition.native,
      // Enable native transitions
      popGesture: true,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.whiteColor,
      ),

      // home: WillPopScope(
      //   onWillPop: () async {
      //     return true;
      //   },
      //   child: const SplashView(),
      // ),


      home:  SliderView(),
      getPages: AppRoutes.appRoutes(),
    );
  }}