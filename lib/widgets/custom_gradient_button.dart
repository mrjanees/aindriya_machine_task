import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/widgets/custom_svg.dart';
import 'package:webwork_task/widgets/custom_text.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton(
      {super.key,
      required this.text,
      required this.onPress,
      this.needShadow,
      this.colors,
      this.textColor,
      this.icon,
      this.iconColor,
      this.horizontalPadding});

  final Function onPress;
  final String text;
  final Color? textColor;
  final double? horizontalPadding;
  final String? icon;
  final Color? iconColor;
  final List<Color>? colors;
  final bool? needShadow;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onPress(),
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 70.w, vertical: 16.h), //
          decoration: BoxDecoration(
            boxShadow: needShadow != null
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    )
                  ]
                : null,
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(
              colors:
                  colors ?? [AppColors.primaryColor, AppColors.secondaryColor],
            ),
          ),
          child: Center(
            child: icon == null
                ? CustomText(
                    text,
                    fontWeight: FontWeight.w400,
                    color: textColor ?? AppColors.whiteColor,
                  )
                : Row(
                    children: [
                      CustomSvgImage(
                        svgName: icon!,
                        color: iconColor,
                        width: 25,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomText(
                        text,
                        fontWeight: FontWeight.w400,
                        color: textColor ?? AppColors.whiteColor,
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
