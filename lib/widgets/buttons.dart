


import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final String? fontFamily;
  final Color? buttonColor, fontColor;
  final double? height, width, fontSize;
  final FontWeight? fontWeight;

  const DefaultButton(
      {required this.onPressed,
      required this.label,
      this.buttonColor,
      this.width,
      this.height,
      this.fontSize,
      this.fontColor,
      this.fontFamily,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize ?? 15,
          color: fontColor ?? Colors.blueAccent[100],
          fontWeight: fontWeight ?? FontWeight.w200,
          fontFamily: 'Roboto',
        ),
      ),
      onPressed: onPressed as void Function(),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.white24)),
        backgroundColor: buttonColor ?? Colors.black54,
        minimumSize: Size(width ?? double.maxFinite, height ?? 55),
      ),
    );
  }
}


class LoginButtonWithIcon extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Icon icon;
  final bool iconIsImage;
  final String imageIcon;

  const LoginButtonWithIcon({
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.iconIsImage,
    required this.imageIcon,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!iconIsImage)
            icon
          else
            ImageIcon(
              AssetImage(imageIcon),
              color: Colors.black,
            ),
          sizedBox5Wide,
          Text(text, style: kGoogleFontOpenSansCondensed),
        ],
      ),
    );
  }

  Widget weatherIcon() {
    return !iconIsImage
        ? icon
        : ImageIcon(
            AssetImage(imageIcon),
            color: Colors.black,
          );
  }
}

class LoginButtonNoIcon extends StatelessWidget {
  final String text;
  final Function onPressed;

  const LoginButtonNoIcon({
    required this.onPressed,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: kGoogleFontOpenSansCondensed),
        ],
      ),
    );
  }
}