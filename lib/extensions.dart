import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstOfEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
  String get capitalizeFirstWord => this.split(" ").map((str) => str).join(" ");
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from < this && this < to;
  }

  bool isInRange(num from, num to) {
    return from <= this && this <= to;
  }
}

extension CustomWidgetExtensions on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget expanded({int flex}) {
    return Expanded(
      child: this,
      flex: flex ?? 1,
    );
  }

  Widget flex({int flex}) {
    return Flex(
      direction: Axis.vertical,
      children: [this],
    );
  }
}
