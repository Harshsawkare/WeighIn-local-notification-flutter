class DateTimeUtil {
  String formatDateTime(DateTime dateTime) {
    // Define a list of month names
    List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    // Get the month name
    String month = monthNames[dateTime.month - 1];

    // Get the day of the month and add the appropriate suffix
    String day = dateTime.day.toString();
    String suffix;
    if (day.endsWith('1') && !day.endsWith('11')) {
      suffix = 'st';
    } else if (day.endsWith('2') && !day.endsWith('12')) {
      suffix = 'nd';
    } else if (day.endsWith('3') && !day.endsWith('13')) {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }

    // Format the date as "Day Month, Year"
    return '$month $day$suffix, ${dateTime.year}';
  }
}
