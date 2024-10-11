import 'package:flutter/material.dart';
import 'package:weighin/utils/date_time.dart';

import '../../utils/color_theme.dart';

class MissedDayCard extends StatelessWidget {
  final DateTime dateTime;
  const MissedDayCard({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Colors.orangeAccent, Colors.redAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Card(
          elevation: 0, // Remove elevation since boxShadow is being used
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color:
              Colors.transparent, // Transparent to keep the gradient background
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  'assets/missed_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      DateTimeUtil().formatDateTime(dateTime),
                      style: const TextStyle(
                        color: ColorTheme.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Text(
                    'Missed',
                    style: TextStyle(
                      color: ColorTheme.missed,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
