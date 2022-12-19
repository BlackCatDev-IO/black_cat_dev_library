import 'package:dart_date/dart_date.dart';

extension DateTimeExtensions on DateTime {
  bool isWithinRange2(
      {required DateTime startTime, required DateTime endTime}) {
    return isWithinRange(startTime, endTime);
  }

  bool isBetween(
      {required DateTime startTime,
      required DateTime endTime,
      required String method,
      Duration? offset}) {
    return this.isAfter(startTime) && this.isBefore(endTime);
  }

  bool isSameTimeOrBetween(
      {required DateTime startTime,
      required DateTime endTime,
      required String method,
      Duration? offset}) {
    final isBetween = this.isAfter(startTime) && this.isBefore(endTime);
    final isSameTime = this.isEqual(startTime) || this.isEqual(endTime);

    return isBetween || isSameTime;
  }

  bool isSameTime({required DateTime comparisonTime}) {
    final time = comparisonTime.toUtc();
    return time == this.toUtc();
  }

  DateTime roundedDownToNearestHour() {
    return this.startOfHour;
  }

  DateTime roundedUpToNearestHour() {
    final endOfHour = this.endOfHour;
    return endOfHour.add(const Duration(microseconds: 1));
  }
}
