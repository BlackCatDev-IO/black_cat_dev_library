import 'package:flutter/material.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstOfEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
  String get capitalizeFirstWord => this.split(" ").map((str) => str).join(" ");
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
