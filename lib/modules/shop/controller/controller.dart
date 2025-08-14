import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webwork_task/modules/dashboard/model/featured_shop.dart';
import 'package:webwork_task/modules/shop/model/best_offers.dart';

class ShopDetailsController extends GetxController {
  RxInt currentBannerIndex = 0.obs;

  RxBool isBestOffersLoading = false.obs;
  List<BestOffer> bestoffers = <BestOffer>[].obs;

  FeaturedShop? shopDetails;

  @override
  void onInit() {
    bestOffers();
    super.onInit();
  }

  void changeBannerImage(int index) {
    currentBannerIndex.value = index;
  }

  Future<void> bestOffers() async {
    isBestOffersLoading.value = true;
    Future.delayed(const Duration(seconds: 3), () {
      bestoffers.clear();
      bestoffers.addAll([
        BestOffer(
            title: "₹1200 OFF",
            date: "Dec 22",
            subTitle: "On Diamond Rings",
            bgColors: [const Color(0xFFC84E89), const Color(0xFFF15F79)]),
        BestOffer(
            title: "BUY1 GET1",
            date: "Jan 10",
            subTitle: "On Platinum Earings",
            bgColors: [const Color(0xFF2193B0), const Color(0xFF6DD5ED)]),
        BestOffer(
            title: "₹1200 OFF",
            date: "Jan 22",
            subTitle: "On Diamond Rings",
            bgColors: [const Color(0xFFBF5AE0), const Color(0xFFA811DA)]),
        BestOffer(
            title: "BUY1 GET1",
            date: "Jan 22",
            subTitle: "On Platinum Earings",
            bgColors: [const Color(0xFF02AAB0), const Color(0xFF00CDAC)])
      ]);
    });
    isBestOffersLoading.value = false;
    update();
  }
}
