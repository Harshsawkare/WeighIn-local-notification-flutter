import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/weight_entry.dart';

class WeightController extends GetxController {
  var weightList = <WeightEntry>[].obs;
  var intWeight = 40.obs;
  var decWeight = 40.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadWeights();
  }

  void loadWeights() {
    List<dynamic> savedWeights = storage.read('weights') ?? [];
    weightList.value = savedWeights.map((e) => WeightEntry.fromMap(e)).toList();
  }

  void addWeight(double weight, DateTime date) {
    weightList.add(WeightEntry(weight: weight, date: date));
    saveWeights();
  }

  void saveWeights() {
    List<Map<String, dynamic>> weightMaps = weightList.map((e) => e.toMap()).toList();
    storage.write('weights', weightMaps);
  }
}
