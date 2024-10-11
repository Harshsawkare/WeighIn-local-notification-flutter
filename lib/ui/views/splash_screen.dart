import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weighin/data/splash_data.dart';
import 'package:weighin/routes/app_routes.dart';
import 'package:weighin/ui/views/home_screen.dart';
import 'package:weighin/ui/views/setup_screen.dart';
import 'package:weighin/utils/color_theme.dart';

import '../../controllers/user_controller.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashData().navigate();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorTheme.white,
        body: Center(
          child: Image.asset("assets/logo_text.png",
            width: Get.size.width * 0.7,),
        ),
      ),
    );
  }
}
