import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/controllers/user_controller.dart';

import '../../utils/color_theme.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  AppTextField({super.key, required this.hint});

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        userController.userName.value = value;
      },
      style: const TextStyle(
        color: ColorTheme.black,
        fontSize: 16,
      ),
      cursorColor: ColorTheme.black,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        prefixIcon: const Icon(
          Icons.person,
          size: 20,
          color: Colors.grey,
        ),
        focusColor: ColorTheme.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        filled: true,
        fillColor: ColorTheme.grey,
      ),
    );
  }
}
