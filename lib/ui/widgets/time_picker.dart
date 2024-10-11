import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:weighin/controllers/time_controller.dart';

import '../../utils/color_theme.dart';

class TimePicker extends StatefulWidget {
  final TimeController timeController;
  const TimePicker({super.key, required this.timeController});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  // Range for hours (0 to 23)
  List<int> hourRange = List.generate(24, (index) => index);

  // Range for minutes (0 to 59)
  List<int> minuteRange = List.generate(60, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Hour Picker
        Column(
          children: [
            const Text(
              'Hour',
              style: TextStyle(
                  color: ColorTheme.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
              height: 150,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: widget.timeController.hour.value,
                ),
                itemExtent: 40.0,
                onSelectedItemChanged: (int index) {
                  widget.timeController.hour.value = hourRange[index];
                },
                children: hourRange.map((hour) {
                  return Center(
                    child: Text(
                      hour.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            ':',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        // Minute Picker
        Column(
          children: [
            const Text(
              'Minute',
              style: TextStyle(
                  color: ColorTheme.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
              height: 150,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: widget.timeController.minute.value,
                ),
                itemExtent: 40.0,
                onSelectedItemChanged: (int index) {
                  widget.timeController.minute.value = minuteRange[index];
                },
                children: minuteRange.map((minute) {
                  return Center(
                    child: Text(
                      minute.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
