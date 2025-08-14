import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/core/constants/images.dart';
import 'package:webwork_task/widgets/custom_image.dart';
import 'package:webwork_task/widgets/custom_text.dart';

class CustomBorderImageButton extends StatelessWidget {
  final String image;
  final String text;
  final _GradientPainter _painter;
  final VoidCallback onPress;

  CustomBorderImageButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPress,
  }) : _painter = _GradientPainter(
            strokeWidth: 1.5,
            radius: 30.r,
            gradient: const LinearGradient(colors: [
              AppColors.whiteColor,
              AppColors.black,
            ]));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CustomPaint(
        painter: _painter,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.r),
          onTap: onPress,
          child: SizedBox(
            width: 300.w,
            height: 60.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(image)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : strokeWidth = strokeWidth,
        radius = radius,
        gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant _GradientPainter oldDelegate) {
    return oldDelegate.gradient != gradient ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
