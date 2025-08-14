import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

functionSnackBar(String message) {
  if (message != '' && Get.context != null) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      messageText: Text(message,
          style: TextStyle(
            fontSize: 12.h,
            height: 1,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          )),
      icon: const Icon(
        Icons.info_outline_rounded,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
    ).show(Get.context!);
  }
}
