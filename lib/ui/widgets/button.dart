import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_theme.dart';

class AppButton extends StatelessWidget {
  final String label;
  double? width;
  double? height;
  final Function() onTap;

  AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.width = 100,
      this.height = 40});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorTheme.primaryColor),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                label,
                style: const TextStyle(
                  color: ColorTheme.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}
