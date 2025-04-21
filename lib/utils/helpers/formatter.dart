import 'package:intl/intl.dart';

class Formatters {
  static String? formatToMonthYear(String? input) {
    if (input == null || input == "" || input == "Present") {
      return "Present";
    }
    final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{4}$');

    if (!regex.hasMatch(input)) return null; // invalid format

    final parts = input.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse(parts[1]);

    final date = DateTime(year, month);
    final formatter = DateFormat('MMMM yyyy'); // e.g., April 2025

    return formatter.format(date);
  }
}
