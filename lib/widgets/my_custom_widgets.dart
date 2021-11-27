library black_cat_lib;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class PullToRefreshPage extends StatelessWidget {
  final Function onRefresh;
  final Widget child;

  const PullToRefreshPage({required this.onRefresh, required this.child});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh as Future<void> Function(),
      child: child,
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final double? radius, height, width, borderWidth;
  final Color? color;
  final Color? borderColor;
  final Widget? child;

  const RoundedContainer(
      {this.radius,
      this.color,
      this.child,
      this.height,
      this.width,
      this.borderColor,
      this.borderWidth});

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

class PartialRoundedContainer extends StatelessWidget {
  final double? topLeft,
      topRight,
      bottomLeft,
      bottomRight,
      height,
      width,
      borderWidth;
  final Color? color;
  final Color? borderColor;
  final Widget? child;

  const PartialRoundedContainer(
      {this.topLeft,
      this.topRight,
      this.bottomLeft,
      this.bottomRight,
      this.height,
      this.width,
      this.borderWidth,
      this.color,
      this.borderColor,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? 0),
          topRight: Radius.circular(topRight ?? 0),
          bottomLeft: Radius.circular(bottomLeft ?? 0),
          bottomRight: Radius.circular(bottomRight ?? 0),
        ),
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
  BlurFilter({required this.child, this.sigmaX = 5.0, this.sigmaY = 5.0});

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
  final double? radius;
  final Widget child;
  final Color? color;
  final double? elevation;

  const MyCard({
    this.radius,
    this.color,
    this.elevation,
    required this.child,
  });

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
  final double? width, height;
  final String path;
  final Color? color;

  const MyAssetImage({this.width, this.height, required this.path, this.color});
  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      image: AssetImage(path),
      color: color,
    );
  }
}

class MyImageContainer extends StatelessWidget {
  final Widget child;
  final String imagePath;
  final double? width, height;

  const MyImageContainer(
      {required this.child, required this.imagePath, this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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

  const MyToggleSwitch({required this.settingsBool, required this.onToggle});
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

class DefaultTextField extends StatelessWidget {
  final int? maxTitleLength;
  final TextEditingController controller;
  final String? hintText, fontFamily;
  final Color? fillColor, borderColor, textColor;
  final ValueChanged<String>? onChanged, onFieldSubmitted;
  final GestureTapCallback? onTap;
  final double? borderRadius, hintSize, fontSize;
  final bool? autoFocus;
  final bool? obscureText;
  final Widget? suffixIcon;
  final FontWeight? fontWeight;

  const DefaultTextField(
      {this.maxTitleLength,
      required this.controller,
      this.hintText,
      this.fillColor,
      this.borderColor,
      this.onChanged,
      this.borderRadius,
      this.onFieldSubmitted,
      this.onTap,
      this.hintSize,
      this.fontSize,
      this.fontFamily,
      this.textColor,
      this.fontWeight,
      this.autoFocus,
      this.obscureText,
      this.suffixIcon});

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
      autofocus: true,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      maxLength: maxTitleLength,
      obscureText: obscureText,
      style: TextStyle(
        color: textColor ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w300,
        fontSize: fontSize ?? 20,
      ),
      onTap: onTap,
      decoration: InputDecoration(
        filled: autoFocus ?? false,
        fillColor: fillColor ?? Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          borderSide: BorderSide(color: borderColor ?? Colors.black),
        ),
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: hintSize ?? 19,
            color: Colors.grey[600],
            fontFamily: fontFamily ?? 'Roboto',
            fontWeight: FontWeight.w200),
        counterText: '',
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Color? color;
  final double size;
  final Widget child;

  const CircleContainer({this.color, required this.size, required this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color ?? Colors.black38,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    ).paddingSymmetric(horizontal: 10);
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

// solves issue of scrollbar not showing up until user scrolls
// even when alwaysVisible is set to true
class MyScrollbar extends StatefulWidget {
  final ScrollableWidgetBuilder builder;
  final ScrollController? scrollController;

  const MyScrollbar({
    this.scrollController,
    required this.builder,
  });

  @override
  _MyScrollbarState createState() => _MyScrollbarState();
}

class _MyScrollbarState extends State<MyScrollbar> {
  ScrollbarPainter? _scrollbarPainter;
  late ScrollController _scrollController;
  Orientation? _orientation;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _updateScrollPainter(_scrollController.position);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollbarPainter = _buildMaterialScrollbarPainter();
  }

  @override
  void dispose() {
    _scrollbarPainter!.dispose();
    super.dispose();
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
      color: Colors.white60,
      textDirection: Directionality.of(context),
      thickness: 2.5,
      radius: const Radius.circular(30),
      fadeoutOpacityAnimation: const AlwaysStoppedAnimation<double>(1.0),
      padding: const EdgeInsets.symmetric(horizontal: 5),
    );
  }

  bool _updateScrollPainter(ScrollMetrics position) {
    _scrollbarPainter!.update(
      position,
      position.axisDirection,
    );
    return false;
  }

  @override
  void didUpdateWidget(MyScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateScrollPainter(_scrollController.position);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        _orientation ??= orientation;
        if (orientation != _orientation) {
          _orientation = orientation;
          _updateScrollPainter(_scrollController.position);
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) =>
              _updateScrollPainter(notification.metrics),
          child: CustomPaint(
            painter: _scrollbarPainter,
            child: widget.builder(context, _scrollController),
          ),
        );
      },
    );
  }
}

class NotchDependentSafeArea extends StatelessWidget {
  final Widget child;
  final bool hasNotch;
  const NotchDependentSafeArea({required this.child, required this.hasNotch});

  @override
  Widget build(BuildContext context) {
    return hasNotch ? child : SafeArea(child: child);
  }
}
