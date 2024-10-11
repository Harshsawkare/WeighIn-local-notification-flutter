import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/weight_entry.dart';

class WeightController extends GetxController {
  var weightList = <WeightEntry>[].obs; // Observable list for weight entries
  var intWeight = 40.obs; // Observable for integer weight
  var decWeight = 40.obs; // Observable for decimal weight
  final storage = GetStorage(); // Instance of GetStorage for local storage

  @override
  void onInit() {
    super.onInit();
    loadWeights(); // Load weights on initialization
  }

  void loadWeights() {
    // Load saved weights from storage
    List<dynamic> savedWeights = storage.read('weights') ?? [];
    weightList.value = savedWeights.map((e) => WeightEntry.fromMap(e)).toList();
  }

  void addWeight(double weight, DateTime date) {
    // Add a new weight entry and save to storage
    weightList.add(WeightEntry(weight: weight, date: date));
    saveWeights();
  }

  void saveWeights() {
    // Save weights to storage
    List<Map<String, dynamic>> weightMaps = weightList.map((e) => e.toMap()).toList();
    storage.write('weights', weightMaps);
  }
}
