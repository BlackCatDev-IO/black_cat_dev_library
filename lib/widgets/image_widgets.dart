import 'package:flutter/material.dart';

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
