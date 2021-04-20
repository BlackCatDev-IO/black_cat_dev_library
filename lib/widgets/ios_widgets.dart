import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSDialogTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? fontColor;

  const IOSDialogTextWidget(
      {required this.text, this.fontSize, this.fontColor});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 17,
          fontWeight: FontWeight.w200,
          color: fontColor ?? Colors.white70,
          fontFamily: '.SF UI Display'),
    );
  }
}
