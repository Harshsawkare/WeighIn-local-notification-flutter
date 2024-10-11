import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class SplashData {
  final storage = GetStorage(); // Initialize GetStorage for local storage access

  void navigate() {
    // Delay navigation for 2 seconds to show splash screen
    Future.delayed(const Duration(seconds: 2)).then((_) {
      // Check if userName is stored in local storage
      if (storage.read('userName') != null) {
        // Navigate to home screen if userName exists
        Get.toNamed(AppRoutes.home);
      } else {
        // Navigate to setup screen if userName does not exist
        Get.toNamed(AppRoutes.setup);
      }
    });
  }
}
