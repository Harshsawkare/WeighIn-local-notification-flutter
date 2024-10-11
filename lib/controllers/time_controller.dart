import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weighin/controllers/user_controller.dart';

class TimeController extends GetxController {
  var hour = TimeOfDay.now().hour.obs;
  var minute = TimeOfDay.now().minute.obs;
  final UserController _userController = Get.put(UserController());
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    if (storage.read('userName') != null) {
      hour.value = _userController.notificationTime.value.hour;
      minute.value = _userController.notificationTime.value.minute;
    }
  }
}
