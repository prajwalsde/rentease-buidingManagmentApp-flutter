import 'package:intl/intl.dart';

String formatDate(DateTime date) => DateFormat('dd MMM yyyy').format(date);
String formatMonth(DateTime date) => DateFormat('MMMM yyyy').format(date);
