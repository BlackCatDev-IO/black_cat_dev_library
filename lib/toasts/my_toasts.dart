import 'package:black_cat_lib/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToasts {
  static FToast fToast = FToast();

  static void _initToast(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
  }

  static void showToast(
      {required String text,
      required BuildContext toastContext,
      Color? backgroundColor,
      Color? textColor,
      double? borderRadius,
      double? horizontalPadding,
      double? verticalPadding}) {
    _initToast(toastContext);
    fToast.showToast(
      child: ToastWidget(
          toastText: text,
          backgroundColor: backgroundColor,
          textColor: textColor,
          borderRadius: borderRadius,
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
