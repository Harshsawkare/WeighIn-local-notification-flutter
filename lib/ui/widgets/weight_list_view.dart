import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/models/weight_entry.dart';
import 'package:weighin/ui/widgets/missed_day_card.dart';
import 'package:weighin/ui/widgets/weight_card.dart';
import '../../controllers/weight_controller.dart';

class WeightListView extends StatelessWidget {
  WeightListView({super.key});

  final WeightController weightController = Get.put(WeightController());

  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Check if weightList is empty
      if (weightController.weightList.isNotEmpty) {
        startDate = getOldestEntry(); // Oldest entry date
        endDate = DateTime.now(); // Current date
      }

      // If no data is available yet
      if (startDate == null && endDate == null) {
        return SizedBox(
          width: Get.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  'assets/onBoard.png',
                  height: 300,
                ),
              ),
              const Text(
                'Welcome onboard',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const Text(
                "let's start tracking",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        );
      } else {
        List<Widget> widgets = [];

        // Iterate through each day from startDate to endDate in descending order
        for (DateTime currentDate = endDate!;
        currentDate.isAfter(startDate!.subtract(const Duration(days: 1)));
        currentDate = currentDate.subtract(const Duration(days: 1))) {

          // Find if the current date exists in the weightList
          WeightEntry? entryForDate = weightController.weightList.firstWhere(
                (entry) =>
            entry.date.year == currentDate.year &&
                entry.date.month == currentDate.month &&
                entry.date.day == currentDate.day,
            orElse: () => WeightEntry(weight: 0, date: currentDate),
          );

          // Check if it's the current day
          bool isCurrentDay = currentDate.year == DateTime.now().year &&
              currentDate.month == DateTime.now().month &&
              currentDate.day == DateTime.now().day;

          // Show weight entry for the current day if it exists
          if (entryForDate.weight > 0) {
            widgets.add(WeightCard(weightEntry: entryForDate));
          } else if (!isCurrentDay && !areDatesEqual(startDate!, endDate!)) {
            // Only show MissedDayCard for past days, not for today
            widgets.add(MissedDayCard(
              dateTime: entryForDate.date,
            ));
          }
        }

        // Return ListView with updates reflected when new weight entries are added
        return ListView.builder(
          itemCount: widgets.length + 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {

            if (widgets.length == index) {
              return const SizedBox(height: 150,);
            }

            return widgets[index];
          },
        );
      }
    });
  }

  DateTime getOldestEntry() {
    return weightController.weightList
        .reduce((a, b) => a.date.isBefore(b.date) ? a : b)
        .date;
  }

  bool areDatesEqual(DateTime start, DateTime end) {
    return start.year == end.year &&
        start.month == end.month &&
        start.day == end.day;
  }
}
