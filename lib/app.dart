import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webwork_task/core/router/routers.dart';
import 'package:webwork_task/core/router/screen_name.dart';
import 'package:webwork_task/core/theme.dart';
import 'package:webwork_task/main.dart';
import 'package:webwork_task/utils/key_unfocus.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'aindriya_machtest',
          // initialRoute: "/",
          theme: appTheme,
          scaffoldMessengerKey: scaffoldMessengerKey,
          builder: (context, child) {
            return KeyboardDismissOnTap(child: child ?? const SizedBox());
          },
          getPages: getXRouteList,
          initialRoute: AppScreen.phoneNumberScreen,
        );
      },
    );
  }
}
