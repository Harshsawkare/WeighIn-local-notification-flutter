import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/controllers/time_controller.dart';
import 'package:weighin/controllers/user_controller.dart';
import 'package:weighin/ui/widgets/snackbar.dart';

import '../controllers/notification_controller.dart';
import '../routes/app_routes.dart';

class SetupData {

  TimeController timeController = Get.put(TimeController());
  UserController userController = Get.put(UserController());

  void saveDetails() {
    final username = userController.userName.value;
    if (username.trim().isNotEmpty) {
      final cTime = timeController;
      final time =
          TimeOfDay(hour: cTime.hour.value, minute: cTime.minute.value);
      userController.saveUserData(username, time);
      NotificationController().scheduleDailyNotification(time);
      Get.toNamed(AppRoutes.home);
      AppSnackbar().show('Hooray!', 'Details added successfully.');
    } else {
      AppSnackbar().show('Error', 'Invalid name. Please enter a valid name.');
    }
  }
}
