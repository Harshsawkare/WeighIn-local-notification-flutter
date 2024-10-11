class WeightEntry {
  double weight; // Stores the weight value
  DateTime date; // Stores the date of the weight entry

  // Constructor to initialize weight and date
  WeightEntry({required this.weight, required this.date});

  // Factory constructor to create a WeightEntry from a map
  factory WeightEntry.fromMap(Map<String, dynamic> map) {
    return WeightEntry(
      weight: map['weight'], // Extract weight from map
      date: DateTime.parse(map['date']), // Parse date from string
    );
  }

  // Method to convert the WeightEntry instance to a map
  Map<String, dynamic> toMap() {
    return {
      'weight': weight, // Convert weight to map
      'date': date.toIso8601String(), // Convert date to ISO 8601 string
    };
  }
}
