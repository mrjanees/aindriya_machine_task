import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/core/constants/images.dart';
import 'package:webwork_task/core/constants/values.dart';
import 'package:webwork_task/modules/login/controllers/login_phonenumber_ctrl.dart';
import 'package:webwork_task/widgets/custom_background.dart';
import 'package:webwork_task/widgets/custom_gradient_button.dart';
import 'package:webwork_task/widgets/custom_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhoneNumberAuthController>();
    controller.startTimer();
    return Scaffold(
      body: CustomBackground(
          removeBottomDesign: true,
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: kSpace * 4, left: kSpace, right: kSpace),
              child: Column(
                children: [
                  CustomText(
                    'OTP Verification',
                    fontSize: 28.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  const SizedBox(
                    height: kSpace,
                  ),
                  CustomText(
                    'Enter the OTP received on your phone',
                    fontSize: 16.sp,
                    color: AppColors.black38,
                    fontWeight: FontWeight.w300,
                  ),
                  const SizedBox(
                    height: kSpace * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.otpLength, (index) {
                      return Container(
                        width: 60,
                        margin: const EdgeInsets.only(left: kSpace),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(colors: [
                                AppColors.whiteColor,
                                AppColors.whiteColor.withOpacity(.3)
                              ])),
                          child: TextField(
                            controller: controller.controllers[index],
                            focusNode: controller.focusNodes[index],
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1),
                            ],
                            maxLength: 1,
                            style:
                                const TextStyle(color: AppColors.primaryColor),
                            textAlign: TextAlign.center,
                            onChanged: (value) =>
                                controller.onOtpChanged(value.trim(), index),
                            decoration: InputDecoration(
                                counterText: "",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                        color: AppColors.whiteColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                        color: AppColors.whiteColor))),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: kSpace * 1.5,
                  ),
                  Obx(() {
                    final minutes = (controller.secondsRemaining.value ~/ 60)
                        .toString()
                        .padLeft(2, '0');
                    final seconds = (controller.secondsRemaining.value % 60)
                        .toString()
                        .padLeft(2, '0');
                    return Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        "$minutes : $seconds",
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                  Align(
                    alignment: Alignment.center,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          controller.resendOtp();
                        },
                        child: RichText(
                          text: TextSpan(
                              style: const TextStyle(height: 2),
                              children: [
                                TextSpan(
                                    text: "Didn't receive the code? ",
                                    style: TextStyle(
                                        color: AppColors.black38,
                                        fontSize: 14.sp,
                                        fontFamily: "ROBOTO",
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "Resend",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 14.sp,
                                        fontFamily: "ROBOTO",
                                        fontWeight: FontWeight.w500))
                              ]),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 150.h,
                      width: 292.w,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Container(
                                height: 2,
                                width: 90,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.2), // Shadow color
                                      offset: const Offset(0,
                                          1), // Horizontal 0, Vertical 5 (only bottom)
                                      blurRadius: 8, // Softness
                                      spreadRadius: 3, // No spread
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(AppImages.message),
                          )
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomGradientButton(
                          text: "Verify",
                          onPress: () {
                            final otp = controller.getOtp();
                            controller.validateOtp(otp);
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: kSpace * 1.5,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

