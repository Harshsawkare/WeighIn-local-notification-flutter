import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/controllers/time_controller.dart';
import 'package:weighin/controllers/user_controller.dart';
import 'package:weighin/data/setup_data.dart';
import 'package:weighin/ui/widgets/button.dart';
import 'package:weighin/ui/widgets/text_field.dart';
import 'package:weighin/ui/widgets/time_picker.dart';

import '../../utils/color_theme.dart';

class SetupScreen extends StatefulWidget {
  SetupScreen({super.key});

  final UserController userController = Get.put(UserController());
  final TimeController timeController = Get.put(TimeController());

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        // Dismiss the keyboard when tapping outside the text field
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: ColorTheme.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    "assets/logo_text.png",
                    width: Get.size.width * 0.5,
                  ),
                ),

                //name field
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: AppTextField(
                    hint: 'Name',
                  ),
                ),

                //time picker
                TimePicker(
                  timeController: widget.timeController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 80),
                  child: SizedBox(
                    width: Get.size.width,
                    child: const Center(
                      child: Text(
                        'you will get a reminder to add weigh every day.',
                        style: TextStyle(
                            color: ColorTheme.primaryColor, fontSize: 12),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),

                //go ahead
                AppButton(
                    label: 'Go ahead',
                    width: 150,
                    height: 45,
                    onTap: () => SetupData().saveDetails()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
