import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weighin/controllers/user_controller.dart';

class TimeController extends GetxController {
  var hour = TimeOfDay.now().hour.obs; // Observable for hour
  var minute = TimeOfDay.now().minute.obs; // Observable for minute
  final UserController _userController = Get.put(UserController());
  final storage = GetStorage(); // Instance of GetStorage for local storage

  @override
  void onInit() {
    super.onInit();
    loadUserData(); // Load user data on initialization
  }

  void loadUserData() {
    if (storage.read('userName') != null) {
      // Load notification time if user data exists
      hour.value = _userController.notificationTime.value.hour;
      minute.value = _userController.notificationTime.value.minute;
    }
  }
}
