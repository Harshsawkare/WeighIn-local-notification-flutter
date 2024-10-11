import 'package:flutter/material.dart';

class ColorTheme {
  // Primary color used throughout the app
  static const Color primaryColor = Color.fromRGBO(215, 215, 215, 1.0);

  // Basic colors
  static const Color black = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color white = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color grey = Color.fromRGBO(245, 245, 245, 1.0);

  // Status colors for weight entries
  static const Color recorded = Color.fromRGBO(52, 143, 22, 1.0); // Color for recorded weight
  static const Color missed = Color.fromRGBO(117, 41, 41, 1.0);   // Color for missed weight entry
}
