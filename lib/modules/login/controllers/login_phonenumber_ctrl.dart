import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webwork_task/core/router/screen_name.dart';
import 'package:webwork_task/utils/scafold_message.dart';

class PhoneNumberAuthController extends GetxController {
  var phoneNumberController = TextEditingController();

  String number = '';
  String flag = '';

  String otp = "";

  var secondsRemaining = 120.obs;
  Timer? _timer;

  final otpLength = 4;
  void startTimer() {
    _timer?.cancel(); // Cancel if already running
    secondsRemaining.value = 120;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  Future<void> sendPhoneNumber(String number) async {
    log(number);
    FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credentions) {},
        verificationFailed: (FirebaseAuthException exeptions) {
          log(exeptions.code.toString());
        },
        codeSent: (smsOTP, token) {
          log("===========$smsOTP============");
        },
        codeAutoRetrievalTimeout: (otp) {},
        phoneNumber: number);
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    // Automatically validate once all fields are filled
    String otp = getOtp();
    if (otp.length == otpLength) {
      validateOtp(otp);
    }
  }

  void validateOtp(String otp) {
    log("OTP Entered: $otp");
    if (otp == "0000") {
      stopTimer();
      Get.offAllNamed(AppScreen.dashBoardScreen);
    } else {
      functionSnackBar("Invalid OTP. Please try again");
    }
  }

  void resendOtp() {
    stopTimer();
    secondsRemaining.value = 120;
    startTimer();
    functionSnackBar("OTP resent successfully");
  }

  void selectNumberAndFlag(String phoneNum, String contryflg) {
    number = phoneNum;
    flag = contryflg;
  }

  String getOtp() {
    return controllers.map((e) => e.text).join();
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }

  void verifyOTP(String userOTP) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: otp, smsCode: userOTP);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
