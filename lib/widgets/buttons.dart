import 'dart:async';

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
    return TextButton(
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize ?? 15,
          color: fontColor ?? Colors.blueAccent[100],
          fontWeight: fontWeight ?? FontWeight.w200,
          fontFamily: fontFamily ?? 'Roboto',
        ),
      ),
      onPressed: onPressed as void Function(),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.white24)),
        primary: buttonColor ?? Colors.transparent,
        onSurface: buttonColor ?? Colors.transparent,
        backgroundColor: buttonColor ?? Colors.transparent,
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

class InkWellSplash extends StatelessWidget {
  InkWellSplash({
    Key? key,
    required this.child,
    required this.onTap,
    this.onDoubleTap,
    this.doubleTapTime = const Duration(milliseconds: 300),
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.splashFactory,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
  })  : assert(enableFeedback != null),
        assert(excludeFromSemantics != null),
        assert(autofocus != null),
        assert(canRequestFocus != null),
        super(key: key);

  final Widget child;
  final GestureTapCallback onTap;
  final GestureTapCallback? onDoubleTap;
  final Duration? doubleTapTime;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final double? radius;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final bool? enableFeedback;
  final bool? excludeFromSemantics;
  final FocusNode? focusNode;
  final bool? canRequestFocus;
  final ValueChanged<bool>? onFocusChange;
  final bool? autofocus;

  Timer? doubleTapTimer;
  bool isPressed = false;
  bool isSingleTap = false;
  bool isDoubleTap = false;

  void _doubleTapTimerElapsed() {
    if (isPressed) {
      isSingleTap = true;
    } else {
      this.onTap();
    }
  }

  void _onTap() {
    isPressed = false;
    if (isSingleTap) {
      isSingleTap = false;
      if (this.onTap != null) this.onTap(); // call user onTap function
    }
    if (isDoubleTap) {
      isDoubleTap = false;
      if (this.onDoubleTap != null) this.onDoubleTap!();
    }
  }

  void _onTapDown(TapDownDetails details) {
    isPressed = true;
    if (doubleTapTimer != null && doubleTapTimer!.isActive) {
      isDoubleTap = true;
      doubleTapTimer!.cancel();
    } else {
      doubleTapTimer = Timer(doubleTapTime!, _doubleTapTimerElapsed);
    }
    if (this.onTapDown != null) this.onTapDown!(details);
  }

  void _onTapCancel() {
    isPressed = isSingleTap = isDoubleTap = false;
    if (doubleTapTimer != null && doubleTapTimer!.isActive) {
      doubleTapTimer!.cancel();
    }
    if (this.onTapCancel != null) this.onTapCancel!();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      child: child,
      onTap: (onDoubleTap != null)
          ? _onTap
          : onTap, // if onDoubleTap is not used from user, then route further to onTap
      onLongPress: onLongPress,
      onTapDown: (onDoubleTap != null) ? _onTapDown : onTapDown,
      onTapCancel: (onDoubleTap != null) ? _onTapCancel : onTapCancel,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics!,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus!,
      onFocusChange: onFocusChange,
      autofocus: autofocus!,
    );
  }
}
