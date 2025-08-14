import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class CustomSvgImage extends StatelessWidget {
  final String svgName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? boxFit;
  bool transform;

  CustomSvgImage(
      {super.key,
      required this.svgName,
      this.height,
      this.width,
      this.color,
      this.boxFit,
      this.transform = true});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: (Directionality.of(context) == TextDirection.ltr)
          ? Matrix4.rotationY(0)
          : Matrix4.rotationY(transform ? math.pi : 0),
      child: SvgPicture.asset(
        svgName,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.fitWidth,
        // allowDrawingOutsideViewBox: true,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
