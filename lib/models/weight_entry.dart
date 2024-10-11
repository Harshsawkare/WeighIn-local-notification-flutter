class WeightEntry {
  double weight;
  DateTime date;

  WeightEntry({required this.weight, required this.date});

  factory WeightEntry.fromMap(Map<String, dynamic> map) {
    return WeightEntry(
      weight: map['weight'],
      date: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'date': date.toIso8601String(),
    };
  }
}
