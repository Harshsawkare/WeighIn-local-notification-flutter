import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  var userName = ''.obs; // Observable for user name
  var notificationTime = TimeOfDay.now().obs; // Observable for notification time
  final storage = GetStorage(); // Instance of GetStorage for local storage

  @override
  void onInit() {
    super.onInit();
    loadUserData(); // Load user data on initialization
  }

  void loadUserData() {
    // Load user name and notification time from storage
    userName.value = storage.read('userName') ?? '';
    notificationTime.value = storage.read('notificationTime') != null
        ? TimeOfDay(
      hour: storage.read('notificationTime')['hour'],
      minute: storage.read('notificationTime')['minute'],
    )
        : TimeOfDay.now(); // Default to current time if not set
  }

  TimeOfDay getNotificationTime() {
    return notificationTime.value; // Getter for notification time
  }

  void saveUserData(String name, TimeOfDay time) {
    // Save user data and notification time to storage
    userName.value = name;
    notificationTime.value = time;
    storage.write('userName', name);
    storage.write('notificationTime', {
      'hour': time.hour,
      'minute': time.minute,
    });
  }
}
