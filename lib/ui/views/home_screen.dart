import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighin/data/home_data.dart';
import 'package:weighin/routes/app_routes.dart';
import 'package:weighin/ui/widgets/weight_list_view.dart';
import 'package:weighin/utils/color_theme.dart';
import '../../controllers/weight_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final WeightController weightController = Get.put(WeightController());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back navigation
      child: Scaffold(
        backgroundColor: ColorTheme.grey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.primaryColor,
          surfaceTintColor: Colors.transparent,
          elevation: 5, // Shadow elevation
          shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            // Logo displayed in the AppBar
            child: Image.asset(
              'assets/logo_text.png',
              width: 100,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.settings), // Navigate to settings
                child: const Icon(
                  Icons.settings,
                  color: ColorTheme.black,
                  size: 25,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: WeightListView(), // Display the list of weight entries
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: HomeData().openAddWeightBottomSheet, // Open bottom sheet to add weight
          foregroundColor: Colors.transparent,
          backgroundColor: ColorTheme.primaryColor,
          child: const Icon(
            Icons.add,
            color: ColorTheme.black,
            size: 25,
          ),
        ),
      ),
    );
  }
}
