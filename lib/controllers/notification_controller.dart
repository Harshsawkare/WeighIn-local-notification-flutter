import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/notification_service.dart';
import 'user_controller.dart';

class NotificationController extends GetxController {
  final UserController _userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    // Initialize the notification service
    NotificationService.init();

    // Schedule notification with the current time
    scheduleDailyNotification(_userController.notificationTime.value);
  }

  // Schedule notification at a specific time
  void scheduleDailyNotification(TimeOfDay time) {
    NotificationService.scheduleNotification(
      title: 'Reminder',
      body: "Hey ${_userController.userName.value}, did you track your weight today?",
      scheduledNotificationDateTime: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        time.hour,
        time.minute,
      ),
      payload: '',
    );
  }

  // Change notification time and reschedule
  void changeNotificationTime(TimeOfDay newTime) {
    // Save the new notification time in user preferences
    _userController.saveUserData(_userController.userName.value, newTime);

    // Cancel the existing notification
    NotificationService.cancelAll();

    // Schedule the new notification
    scheduleDailyNotification(newTime);
  }
}
