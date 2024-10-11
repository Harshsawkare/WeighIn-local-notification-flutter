import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/data/settings_data.dart';
import 'package:weighin/ui/widgets/button.dart';

import '../../controllers/time_controller.dart';
import '../../utils/color_theme.dart';
import '../widgets/time_picker.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final TimeController timeController = Get.put(TimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryColor,
        surfaceTintColor: Colors.transparent,
        elevation: 5, // Shadow elevation
        shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            // Logo displayed in the AppBar
            child: Image.asset(
              'assets/logo.png',
              width: 40,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Edit reminder time',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

            //time picker
            TimePicker(
              timeController: timeController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 80),
              child: SizedBox(
                width: Get.size.width,
                child: const Center(
                  child: Text(
                    'you will get a reminder to add weigh every day.',
                    style:
                        TextStyle(color: ColorTheme.primaryColor, fontSize: 12),
                    maxLines: 2,
                  ),
                ),
              ),
            ),

            //reset
            AppButton(
                label: 'Reset',
                onTap: () => SettingsData().saveDetails()),
          ],
        ),
      ),
    );
  }
}
