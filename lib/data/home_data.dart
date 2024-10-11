import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/ui/widgets/snackbar.dart';

import '../controllers/weight_controller.dart';
import '../ui/widgets/button.dart';
import '../ui/widgets/weight_picker.dart';
import '../utils/date_time.dart';

class HomeData {
  final WeightController weightController = Get.put(WeightController());

  void openAddWeightBottomSheet() {
    DateTime now = DateTime.now();

    // Check if any date in the list matches the current date (ignoring time)
    bool entryAdded = weightController.weightList.any((element) {
      DateTime date = element.date;

      // Check if the date matches today's date (ignoring time)
      return date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
    });

    if (!entryAdded) {
      // allow user to add weight entry
      getBottomSheet();
    } else {
      AppSnackbar().show('Oops', "You've already made the entry for today");
    }
  }

  void getBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with current date
            Text(
              DateTimeUtil().formatDateTime(DateTime.now()),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // Weight input field
            WeightPicker(
              weightController: weightController,
            ),

            // Save button
            Center(
              child: AppButton(
                  label: 'Save',
                  height: 35,
                  width: 80,
                  onTap: saveWeightDetails),
            ),
          ],
        ),
      ),
    );
  }

  void saveWeightDetails() {
    // Retrieve the integer and decimal parts of the weight
    final intVal = weightController.intWeight.value;
    final decVal = weightController.decWeight.value;

    // Calculate the total weight as a double
    final double weight = intVal + decVal / 100;
    // Add the weight entry with the current date
    weightController.addWeight(weight, DateTime.now());

    Get.back(); // Go back to the previous screen
  }

}
