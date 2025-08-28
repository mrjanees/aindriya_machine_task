import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/core/constants/images.dart';
import 'package:webwork_task/core/constants/values.dart';
import 'package:webwork_task/core/router/screen_name.dart';
import 'package:webwork_task/modules/login/controllers/login_phonenumber_ctrl.dart';
import 'package:webwork_task/utils/scafold_message.dart';
import 'package:webwork_task/widgets/custom_background.dart';
import 'package:webwork_task/widgets/custom_gradient_button.dart';

import 'package:webwork_task/widgets/custom_text.dart';

class LoginWithPhoneNumber extends StatelessWidget {
  LoginWithPhoneNumber({super.key});
  bool isNumberValid = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhoneNumberAuthController>();

    Country? country;
    return Scaffold(
      body: CustomBackground(
          removeBottomDesign: true,
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: kSpace * 4, left: kSpace, right: kSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wonder App',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: "JOST",
                      fontSize: 38.sp,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            AppColors.primaryColor,
                            AppColors.secondaryColor
                          ],
                        ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                    ),
                  ),
                  const SizedBox(
                    height: kSpace * 3,
                  ),
                  CustomText(
                    "Login",
                    color: AppColors.black54,
                    fontWeight: FontWeight.w800,
                    fontSize: 28.sp,
                  ),
                  const SizedBox(
                    height: kSpace * 2,
                  ),
                  CustomText(
                    "Enter your phone number",
                    color: AppColors.black54,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                  ),
                  const SizedBox(
                    height: kSpace,
                  ),
                  IntlPhoneField(
                      disableLengthCheck: true,
                      controller: controller.phoneNumberController,
                      flagsButtonPadding: EdgeInsets.only(
                        left: 20.h,
                        top: 10.h,
                        bottom: 10.h,
                      ),
                      // autovalidateMode: AutovalidateMode.always,
                      keyboardType: TextInputType.phone,
                      dropdownIconPosition: IconPosition.trailing,
                      showCountryFlag: true,
                      initialCountryCode: 'IN',
                      style: const TextStyle(color: AppColors.lightGray),
                      dropdownTextStyle: const TextStyle(
                        color: AppColors.lightGray,
                        fontWeight: FontWeight.bold,
                      ),
                      showDropdownIcon: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 18.h,
                        ),
                        hintText: "",
                        hintStyle: TextStyle(
                            color: AppColors.lightGray, fontSize: 14.sp),
                        enabledBorder: InputBorder.none,
                        errorStyle: const TextStyle(color: AppColors.red),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.red)),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      validator: (value) {
                        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                        RegExp regExp = RegExp(patttern);
                        if (value!.number.isEmpty) {
                          return '  Please enter mobile number';
                        } else if (!regExp.hasMatch(value.number)) {
                          return '  Please enter valid mobile number';
                        }
                        return null;
                      },
                      onCountryChanged: (value) {
                        country = value;
                        // controller.phoneNumberController.clear();
                      },
                      onChanged: (value) {
                        if (country != null) {
                          if (value.number.length >= country!.minLength &&
                              value.number.length <= country!.maxLength) {
                            isNumberValid = true;
                          } else {
                            isNumberValid = false;
                          }
                        } else {
                          if (value.number.length == 10) {
                            isNumberValid = true;
                          } else {
                            isNumberValid = false;
                          }
                        }
                      }),
                  SizedBox(
                    height: kSpace.h,
                  ),
                  SizedBox(
                    height: 229.h,
                    width: 292.w,
                    child: Image.asset(AppImages.loginImage),
                  ),
                  SizedBox(
                    height: kSpace.h * 2,
                  ),
                  CustomText(
                    "By clicking login, you agree to our terms and policies",
                    color: AppColors.black54,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                  SizedBox(
                    height: kSpace.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomGradientButton(
                        text: 'LOGIN',
                        onPress: () {
                          log(isNumberValid.toString());
                          if (isNumberValid) {
                            // if (country == null) {
                            //   controller.sendPhoneNumber(
                            //       "+91${controller.phoneNumberController.text.trim()}");
                            // } else {
                            //   controller.sendPhoneNumber(
                            //       "${country!.dialCode}${controller.phoneNumberController.text.trim()}");
                            // }
                            controller.selectNumberAndFlag(
                                country == null
                                    ? "+91${controller.phoneNumberController.text.trim()}"
                                    : "${country!.dialCode}${controller.phoneNumberController.text.trim()}",
                                country == null ? "🇮🇳" : country!.flag);
                            Get.toNamed(AppScreen.otpScreen);
                          } else if (controller
                              .phoneNumberController.text.isEmpty) {
                            functionSnackBar("Please Enter Number!");
                             functionSnackBar("Please Enter Number!");
                          } else {
                            functionSnackBar("Please enter a valid number!");
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
