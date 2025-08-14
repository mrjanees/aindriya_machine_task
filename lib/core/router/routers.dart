import 'package:get/get.dart';
import 'package:webwork_task/core/router/screen_name.dart';
import 'package:webwork_task/modules/login/binding/auth_binding.dart';
import 'package:webwork_task/modules/login/view/login_phonenumber.dart';
import 'package:webwork_task/modules/login/view/otp_screen.dart';
import 'package:webwork_task/modules/dashboard/binding/binding.dart';
import 'package:webwork_task/modules/dashboard/view/dashboard_screen.dart';
import 'package:webwork_task/modules/shop/view/shop_details.dart';

List<GetPage> getXRouteList = [
  // GetPage(name: ScreenName.splashScreen, page: () => SplashView()),

  GetPage(
      name: AppScreen.dashBoardScreen,
      page: () => const DashboardScreen(),
      binding: DashBoardBinding()),
  GetPage(
    name: AppScreen.phoneNumberScreen,
    page: () => LoginWithPhoneNumber(),
    binding: PhoneNumberAuthBinding(),
  ),
  GetPage(
    name: AppScreen.otpScreen,
    page: () => const OtpScreen(),
  ),
  GetPage(
    name: AppScreen.shopDetails,
    page: () => const ShopDetails(),
  ),
];
