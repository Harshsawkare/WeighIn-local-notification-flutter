import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/controllers/time_controller.dart';
import 'package:weighin/ui/widgets/snackbar.dart';
import '../controllers/notification_controller.dart';

class SettingsData {
  // Initialize TimeController
  TimeController timeController = Get.put(TimeController());

  void saveDetails() {
    // Create a TimeOfDay object with the current hour and minute
    final time = TimeOfDay(
        hour: timeController.hour.value, minute: timeController.minute.value);

    // Update the notification time using NotificationController
    NotificationController().changeNotificationTime(time);

    Get.back(); // Go back to the previous screen
    // Show a success snackbar
    AppSnackbar().show('Gotchya!', 'Details updated successfully.');
  }
}
