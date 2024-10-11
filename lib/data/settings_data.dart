import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/controllers/time_controller.dart';
import 'package:weighin/ui/widgets/snackbar.dart';

import '../controllers/notification_controller.dart';

class SettingsData {

  TimeController timeController = Get.put(TimeController());

  void saveDetails() {
    final time = TimeOfDay(
        hour: timeController.hour.value, minute: timeController.minute.value);
    NotificationController().changeNotificationTime(time);
    Get.back();
    AppSnackbar().show('Gotchya!', 'Details updated successfully.');
  }
}
