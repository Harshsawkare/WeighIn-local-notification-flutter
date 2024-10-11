import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_routes.dart';

class SplashData{

  final storage = GetStorage();

  void navigate(){
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (storage.read('userName') != null) {
        Get.toNamed(AppRoutes.home);
      } else {
        Get.toNamed(AppRoutes.setup);
      }
    });
  }
}