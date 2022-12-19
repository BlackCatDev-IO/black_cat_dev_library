import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final double? spacing;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const MyTextWidget(
      {required this.text,
      this.fontSize,
      this.color,
      this.spacing,
      this.fontWeight,
      this.fontFamily,
      this.textStyle,
      this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle ??
          TextStyle(
            fontSize: fontSize ?? 16,
            color: color ?? Colors.white70,
            letterSpacing: spacing,
            fontWeight: fontWeight ?? FontWeight.w300,
            fontFamily: fontFamily ?? 'Roboto',
          ),
    );
  }
}

class MyRichTextWidget extends StatelessWidget {
  final String text1, text2;
  final Color text1Color, text2Color;
  final double text1FontSize, text2FontSize;
  final FontWeight? text1FontWeight, text2FontWeight;

  const MyRichTextWidget(
      {required this.text1,
      required this.text2,
      required this.text1Color,
      required this.text2Color,
      required this.text1FontSize,
      required this.text2FontSize,
      this.text1FontWeight,
      this.text2FontWeight});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
            color: text1Color,
            fontWeight: text1FontWeight ?? FontWeight.normal,
            decoration: TextDecoration.underline),
        children: [
          TextSpan(
            text: text2,
            style: TextStyle(
                color: text2Color,
                fontWeight: text2FontWeight ?? FontWeight.normal,
                decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}

class BorderTextStack extends StatelessWidget {
  final String? text;
  final double? fontSize, height;
  final Color textColor, borderColor;

  const BorderTextStack(
      {this.text,
      this.fontSize,
      this.height,
      required this.textColor,
      required this.borderColor});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text!,
          style: TextStyle(
            fontSize: fontSize ?? 20,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.5
              ..color = borderColor,
            height: height,
          ),
        ),
        Text(
          text!,
          style: TextStyle(
            color: textColor,
            // color: Colors.white,
            fontSize: fontSize ?? 20,
            height: height,
          ),
        ),
      ],
    );
  }
}
