import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget(
      {required this.toastText,
      this.backgroundColor,
      this.textColor,
      this.borderRadius,
      this.horizontalPadding,
      this.verticalPadding});

  final String toastText;
  final Color? backgroundColor, textColor;
  final double? borderRadius, horizontalPadding, verticalPadding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: (width - 20),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 24.0,
          vertical: verticalPadding ?? 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
        color: backgroundColor ?? Colors.white,
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              toastText,
              style: TextStyle(color: textColor ?? Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
