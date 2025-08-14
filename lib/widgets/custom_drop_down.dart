import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webwork_task/core/constants/colors.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {super.key,
      required this.item,
      required this.text,
      required this.value,
      required this.onChanged,
      this.iconColor = AppColors.whiteColor,
      this.icon,
      this.padding,
      this.hintFontSize = 16,
      this.textFont = 16,
      this.hintColor = Colors.grey,
      this.textColor = AppColors.black,
      this.color = Colors.grey});
  final String? value;
  final Color iconColor;
  final double hintFontSize;
  final double textFont;
  final Color textColor;
  final Color hintColor;
  final String text;
  final Widget? icon;
  Color color;
  final List<DropdownMenuItem<String>> item;
  Function(String) onChanged;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: padding,
        padding:
            const EdgeInsets.only(left: 13, top: 08.5, bottom: 08.5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: const LinearGradient(colors: [
              AppColors.fadewhiteColor,
              AppColors.fadeBlack,
            ])),
        child: DropdownButton<String>(
          
          padding: EdgeInsets.zero,
          value: value,
          isExpanded: true,
          style: TextStyle(fontSize: textFont, color: textColor),
          iconSize: 35,
          iconEnabledColor: iconColor,
          underline: const SizedBox(),
          hint: Text(
            text,
            style: TextStyle(color: hintColor, fontSize: hintFontSize),
          ),
          icon: icon,
          items: item,
          onChanged: (value) {
            onChanged(value!);
          },
        ));
  }
}
