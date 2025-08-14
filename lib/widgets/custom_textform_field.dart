import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/core/constants/values.dart';

class CustomTextformField extends StatelessWidget {
  const CustomTextformField(
      {super.key,
      this.textInputFormatter = const [],
      required this.textEditingController,
      required this.fieldName,
      required this.hintText,
      required this.isThisFieldRequired,
      this.validator});
  final TextEditingController textEditingController;
  final bool isThisFieldRequired;
  final String? Function(String value)? validator;
  final List<TextInputFormatter> textInputFormatter;
  final String fieldName;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(style: const TextStyle(height: 2), children: [
            TextSpan(
                text: fieldName,
                style: TextStyle(
                    color: AppColors.formFieldColor,
                    fontSize: 14.sp,
                    fontFamily: "AvenirLTStd",
                    fontWeight: FontWeight.w500)),
            isThisFieldRequired
                ? TextSpan(
                    text: "*",
                    style: TextStyle(
                        color: AppColors.red,
                        fontSize: 14.sp,
                        fontFamily: "AvenirLTStd",
                        fontWeight: FontWeight.w500))
                : const TextSpan()
          ]),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: const LinearGradient(colors: [
                AppColors.fadewhiteColor,
                AppColors.fadeBlack,
              ])),
          child: TextFormField(
            onChanged: (_) {
              Form.of(context).validate();
            },
            validator: (value) {
              if (isThisFieldRequired) {
                if (validator != null) {
                  return validator!(value!);
                } else if (value!.isEmpty) {
                  return 'Enter the $fieldName';
                } else {
                  return null;
                }
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: kSpace),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: AppColors.formFieldColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500)),
            style: TextStyle(
                color: AppColors.formFieldColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: kSpace,
        )
      ],
    );
  }
}
