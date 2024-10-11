import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var notificationTime = TimeOfDay.now().obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    userName.value = storage.read('userName') ?? '';
    notificationTime.value = storage.read('notificationTime') != null
        ? TimeOfDay(
            hour: storage.read('notificationTime')['hour'],
            minute: storage.read('notificationTime')['minute'],
          )
        : TimeOfDay.now();
  }

  TimeOfDay getNotificationTime () {
    return notificationTime.value;
  }

  void saveUserData(String name, TimeOfDay time) {
    userName.value = name;
    notificationTime.value = time;
    storage.write('userName', name);
    storage.write('notificationTime', {
      'hour': time.hour,
      'minute': time.minute,
    });
  }
}
