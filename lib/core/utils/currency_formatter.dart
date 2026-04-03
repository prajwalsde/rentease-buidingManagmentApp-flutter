import 'package:intl/intl.dart';

String formatRupees(double amount) {
  final formatter = NumberFormat.currency(locale: 'en_IN', symbol: '\u20B9', decimalDigits: 0);
  return formatter.format(amount);
}
