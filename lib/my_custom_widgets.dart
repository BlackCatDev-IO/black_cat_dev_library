library black_cat_lib;

import 'dart:ui';

import 'package:flutter/material.dart';

import 'constants.dart';





class MyTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const MyTextWidget({Key key, this.text, this.fontSize, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text != null ? text : ' ',
        style: kGoogleFontOpenSansCondensed.copyWith(
            fontSize: fontSize ?? 20, color: color ?? Colors.white70));
  }
}

class PullToRefreshPage extends StatelessWidget {
  final Function onRefresh;
  final Widget child;

  const PullToRefreshPage({Key key, this.onRefresh, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        child: Container(height: screenHeight, child: child),
      ),
    );
  }
}

class PullToRefreshPage2 extends StatelessWidget {
  final Function onRefresh;
  final Widget child;

  const PullToRefreshPage2({Key key, this.onRefresh, this.child})
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
  final Widget child;

  const RoundedContainer(
      {Key key, this.radius, this.color, this.child, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12),
        color: color ?? Colors.transparent,
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
      image:
          AssetImage(path ?? 'assets/icons/vclouds_icons/moon_with_cloud.png'),
      color: color,
      // color: Colors.black,
    );
  }
}
