import 'package:flutter/material.dart';

extension CustomWidgetExtensions on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget expanded({int? flex}) {
    return Expanded(
      child: this,
      flex: flex ?? 1,
    );
  }

  Widget flex() {
    return Flex(
      direction: Axis.vertical,
      children: [this],
    );
  }
}
