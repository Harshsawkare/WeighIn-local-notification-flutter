import 'package:get/get.dart';
import 'package:weighin/ui/views/home_screen.dart';
import 'package:weighin/ui/views/settings_screen.dart';

import '../ui/views/setup_screen.dart';
import '../ui/views/splash_screen.dart';


class AppPages {
  static final pages = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/setup', page: () => SetupScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/settings', page: () => SettingsScreen()),
  ];
}
