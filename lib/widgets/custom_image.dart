import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  CustomImage({super.key, required this.imageName, this.height, this.width});
  final String imageName;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Image(
          image: AssetImage(imageName),
          fit: BoxFit.cover,
        ));
  }
}
