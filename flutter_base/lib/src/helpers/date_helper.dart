import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime dateTime) {
    return DateFormat.yMMMd().format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat.Hm().format(dateTime);
  }
}