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

  const MyTextWidget(
      {Key key, this.text, this.fontSize, this.color, this.spacing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text != null ? text : ' ',
      style: kGoogleFontOpenSansCondensed.copyWith(
          fontSize: fontSize ?? 20,
          color: color ?? Colors.white70,
          letterSpacing: spacing ?? 1.0),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Color buttonColor;
  final Color fontColor;
  final double height;
  final double width;
  final double fontSize;

  const DefaultButton(
      {@required this.onPressed,
      @required this.label,
      this.buttonColor,
      this.width,
      this.height,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        label ?? '',
        style: TextStyle(
            fontSize: fontSize ?? 15,
            color: fontColor ?? Colors.blueAccent[100],
            fontWeight: FontWeight.w200),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.white24)),
      color: buttonColor ?? Colors.black54,
      minWidth: width ?? double.maxFinite,
      height: height ?? 55,
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
  final double radius, height, width;
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
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12),
        color: color ?? Colors.transparent,
        border: Border.all(color: borderColor ?? Colors.transparent),
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
      color: color ?? Colors.black54,
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
