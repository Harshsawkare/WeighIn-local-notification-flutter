import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:weighin/controllers/time_controller.dart';
import 'package:weighin/controllers/weight_controller.dart';

import '../../utils/color_theme.dart';

class WeightPicker extends StatefulWidget {
  final WeightController weightController;
  const WeightPicker({super.key, required this.weightController});

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  // Range for integer (30 to 150)
  List<int> integerRange = List.generate(151, (index) => index);

  // Range for decimal (0 to 99)
  List<int> decimalRange = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // integer Picker
        SizedBox(
          width: 100,
          height: 150,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: widget.weightController.intWeight.value,
            ),
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              widget.weightController.intWeight.value = integerRange[index];
            },
            children: integerRange.map((integer) {
              return Center(
                child: Text(
                  integer.toString().padLeft(2, '0'),
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            ':',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),

        // Decimal Picker
        SizedBox(
          width: 100,
          height: 150,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: widget.weightController.decWeight.value,
            ),
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              widget.weightController.decWeight.value = decimalRange[index];
            },
            children: decimalRange.map((decimal) {
              return Center(
                child: Text(
                  decimal.toString().padLeft(2, '0'),
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
