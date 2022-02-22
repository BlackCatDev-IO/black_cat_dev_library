import 'package:flutter/material.dart';

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

class CircleContainer extends StatelessWidget {
  final Color? color;
  final double size;
  final Widget child;

  const CircleContainer({this.color, required this.size, required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Material(
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
      ),
    );
  }
}
