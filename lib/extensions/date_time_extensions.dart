import 'package:dart_date/dart_date.dart';

extension DateTimeExtensions on DateTime {
  bool isWithinRange2(
      {required DateTime startTime, required DateTime endTime}) {
    return isWithinRange(startTime, endTime);
  }

  bool isBetween({required DateTime startTime, required DateTime endTime}) {
    final start = startTime.toUtc();
    final end = endTime.toUtc();
    final utc = this.toUtc();

    if (utc.isAfter(start) && utc.isBefore(end)) {
      return true;
    } else {
      return false;
    }
  }

  bool isSameTime({required DateTime comparisonTime}) {
    final time = comparisonTime.toUtc();
    return time == this.toUtc();
  }

  DateTime roundedDownToNearestHour() {
    final startOfHour = this.startOfHour;
    return startOfHour;
  }

  DateTime roundedUpToNearestHour() {
    final endOfHour = this.endOfHour;
    return endOfHour.add(const Duration(microseconds: 1));
  }
}
