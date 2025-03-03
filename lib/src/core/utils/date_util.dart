import 'package:intl/intl.dart';

class CustomDateUtils {
  static String formatDate(DateTime date) {
    return DateFormat('EEEE, dd MMMM, yyyy', 'vi').format(date);
  }
}
