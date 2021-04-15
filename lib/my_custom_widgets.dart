library black_cat_lib;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final double spacing;
  final FontWeight fontWeight;
  final String fontFamily;

  const MyTextWidget(
      {this.text,
      this.fontSize,
      this.color,
      this.spacing,
      this.fontWeight,
      this.fontFamily});
  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
        style: kGoogleFontOpenSansCondensed.copyWith(
            fontSize: fontSize ?? 20,
            color: color ?? Colors.white70,
            letterSpacing: spacing ?? 1.0,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontFamily: fontFamily ?? 'OpenSans'));
  }
}

class DefaultButton extends StatelessWidget {
  final Function onPressed;
  final String label, fontFamily;
  final Color buttonColor, fontColor;
  final double height, width, fontSize;
  final FontWeight fontWeight;

  const DefaultButton(
      {@required this.onPressed,
      @required this.label,
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
        label ?? '',
        style: TextStyle(
          fontSize: fontSize ?? 15,
          color: fontColor ?? Colors.blueAccent[100],
          fontWeight: fontWeight ?? FontWeight.w200,
          fontFamily: 'Roboto',
        ),
      ),
      onPressed: onPressed,
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

class PullToRefreshPage extends StatelessWidget {
  final Function onRefresh;
  final Widget child;

  const PullToRefreshPage(
      {Key key, @required this.onRefresh, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final double radius, height, width, borderWidth;
  final Color color;
  final Color borderColor;
  final Widget child;

  const RoundedContainer(
      {Key key,
      this.radius,
      this.color,
      this.child,
      this.height,
      this.width,
      this.borderColor,
      this.borderWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12),
        color: color ?? Colors.transparent,
        border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0),
      ),
      child: child,
    );
  }
}

class BlurFilter extends StatelessWidget {
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  BlurFilter({this.child, this.sigmaX = 5.0, this.sigmaY = 5.0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: sigmaX,
              sigmaY: sigmaY,
            ),
            child: Opacity(
              opacity: 0.01,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final double radius;
  final Widget child;
  final Color color;
  final double elevation;

  const MyCard({
    Key key,
    this.radius,
    this.color,
    this.elevation,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.transparent,
      elevation: elevation ?? 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 15),
      ),
      child: child,
    );
  }
}

class MyAssetImage extends StatelessWidget {
  final double width, height;
  final String path;
  final Color color;

  const MyAssetImage({Key key, this.width, this.height, this.path, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      image: AssetImage(path ?? 'assets/icons/vclouds_icons/clear_day.png'),
      color: color,
      // color: Colors.black,
    );
  }
}

class MyImageContainer extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const MyImageContainer({Key key, this.child, @required this.imagePath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}

class MyToggleSwitch extends StatefulWidget {
  final bool settingsBool;
  final Function onToggle;

  const MyToggleSwitch({Key key, this.settingsBool, this.onToggle})
      : super(key: key);
  @override
  _MyToggleSwitchState createState() => _MyToggleSwitchState();
}

class _MyToggleSwitchState extends State<MyToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
// value: settingsController.notificationSound,
      value: widget.settingsBool,
      onChanged: (value) {
        setState(() {});
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }
}

class ObxToggleSwitch extends StatelessWidget {
  final RxBool settingsBool;

  ObxToggleSwitch({@required this.settingsBool});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (settingsBool) => Switch(
        value: settingsBool.value,
        onChanged: (value) {
          settingsBool.value =
              value; // Rx has a _callable_ function! You could use (flag) => data.value = flag,
        },
      ),
      false.obs,
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
    Key key,
    this.onPressed,
    this.text,
    this.icon,
    this.iconIsImage,
    this.imageIcon,
  }) : super(key: key);
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
    Key key,
    this.onPressed,
    this.text,
  }) : super(key: key);
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

class DefaultTextField extends StatelessWidget {
  final int maxTitleLength;
  final TextEditingController controller;
  final String hintText;
  final Color fillColor, borderColor;
  final Function onChanged, onFieldSubmitted, onTap;
  final double borderRadius;

  const DefaultTextField(
      {Key key,
      this.maxTitleLength,
      this.controller,
      this.hintText,
      this.fillColor,
      this.borderColor,
      this.onChanged,
      this.borderRadius,
      this.onFieldSubmitted,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool obscureText;
    if (hintText == 'Password') {
      obscureText = true;
    } else {
      obscureText = false;
    }
    return TextFormField(
      controller: controller,
      onChanged: onChanged as void Function(String),
      onFieldSubmitted: onFieldSubmitted as void Function(String),
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      maxLength: maxTitleLength,
      obscureText: obscureText,
      style: kGoogleFontOpenSansCondensed.copyWith(
        color: fillColor,
      ),
      onTap: onTap as void Function(),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          borderSide: BorderSide(color: borderColor ?? Colors.blue),
        ),
        hintText: hintText,
        hintStyle: kGoogleFontOpenSansCondensed.copyWith(
            fontSize: 19, color: Colors.grey[400]),
        counterText: ' ',
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Color color;
  final double radius;
  final Widget child;

  const CircleContainer({this.color, @required this.radius, this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: color ?? Colors.black38,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    ).paddingSymmetric(horizontal: 10);
  }
}
