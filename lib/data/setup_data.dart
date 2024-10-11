import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/controllers/time_controller.dart';
import 'package:weighin/controllers/user_controller.dart';
import 'package:weighin/ui/widgets/snackbar.dart';

import '../controllers/notification_controller.dart';
import '../routes/app_routes.dart';

class SetupData {
  // Initialize TimeController and UserController
  TimeController timeController = Get.put(TimeController());
  UserController userController = Get.put(UserController());

  void saveDetails() {
    final username = userController.userName.value; // Get the username
    // Check if the username is not empty
    if (username.trim().isNotEmpty) {
      final cTime = timeController;
      // Create a TimeOfDay object from the controller values
      final time = TimeOfDay(hour: cTime.hour.value, minute: cTime.minute.value);

      // Save user data and schedule daily notification
      userController.saveUserData(username, time);
      NotificationController().scheduleDailyNotification(time);

      Get.toNamed(AppRoutes.home); // Navigate to home screen
      // Show success snackbar
      AppSnackbar().show('Hooray!', 'Details added successfully.');
    } else {
      // Show error snackbar if username is invalid
      AppSnackbar().show('Error', 'Invalid name. Please enter a valid name.');
    }
  }
}
