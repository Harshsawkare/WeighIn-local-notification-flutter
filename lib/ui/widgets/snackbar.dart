import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  void show(String title, String message) {
    Get.snackbar(
      title, // Title of the snackbar
      message, // Message to display
      snackPosition: SnackPosition.BOTTOM, // Position at the bottom
      duration:
      const Duration(seconds: 2), // Duration for the snackbar to be visible
    );
  }
}
