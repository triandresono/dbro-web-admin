part of '../extension.dart';

extension DateTimeExtenson on DateTime? {
  bool get is_adult {
    final date = this ?? DateTime.now();
    var today = DateTime.now();
    var yearDiff = today.year - date.year;
    var monthDiff = today.month - date.month;
    var dayDiff = today.day - date.day;
    return yearDiff > 17 || yearDiff == 17 && monthDiff >= 0 && dayDiff >= 0;
  }

  String fromDate([String format = 'yyyy-MM-dd']) {
    if ((this) != null) {
      return DateFormat(format).format(this ?? DateTime.now());
    } else {
      return '';
    }
  }
}
