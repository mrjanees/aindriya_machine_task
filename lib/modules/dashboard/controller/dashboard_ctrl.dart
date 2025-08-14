import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:webwork_task/core/constants/images.dart';
import 'package:webwork_task/core/router/screen_name.dart';
import 'package:webwork_task/modules/dashboard/model/featured_shop.dart';
import 'package:webwork_task/modules/shop/controller/controller.dart';

class DashBoardController extends GetxController {
  List<FeaturedShop> featuredShopsList = <FeaturedShop>[].obs;
  RxBool isFeaturedShopsLoading = false.obs;

  @override
  void onInit() {
    featuredShops();
    super.onInit();
  }

  Future<void> featuredShops() async {
    isFeaturedShopsLoading.value = true;
    await Future.delayed(const Duration(seconds: 3), () {
      featuredShopsList.clear();
      featuredShopsList.addAll([
        FeaturedShop(
          image: AppImages.zudioShoppee,
          name: 'Zudio Shoppee',
          type: 'Textile',
          reviewCount: '125',
          starCount: 4,
          typeIcon: AppImages.textiles,
          badgeColors: [const Color(0xFFF2709C), const Color(0xFFFF9472)],
          badgeName: 'Trending',
          location: '2nd Floor,  Centre Square Mall, Kochi, Kerala',
          contact: '+91 9565521331, +91 9546542133',
          opening: '09:30 am - 06:00 pm',
          banners: [
            AppImages.grafJewellers,
            AppImages.antaraCloths,
            AppImages.ashokaJewellwers
          ],
          locationUrl:
              'https://www.google.com/maps/dir/?api=1&origin=Kochi,+Kerala&destination=Kakkanad,+Kerala&travelmode=driving',
        ),
        FeaturedShop(
          image: AppImages.ashokaJewellwers,
          name: 'Ashoka Jewellers',
          type: 'Jewellers',
          reviewCount: '110',
          starCount: 5,
          typeIcon: AppImages.jewellery,
          badgeColors: [const Color(0xFF72C6EF), const Color(0xFF004E8F)],
          badgeName: 'Best Rewards',
          location: 'Narayanashan Road, Vytilla, Kochi, Kerala',
          contact: '+91 9565521331, +91 9546542133',
          opening: '10:00 am - 07:00 pm',
          banners: [
            AppImages.antaraCloths,
            AppImages.ashokaJewellwers,
            AppImages.grafJewellers,
          ],
          locationUrl:
              'https://www.google.com/maps/dir/?api=1&origin=Kochi,+Kerala&destination=Kakkanad,+Kerala&travelmode=driving',
        ),
        FeaturedShop(
          image: AppImages.nihaJewellers,
          name: 'Niha Jewellers',
          type: 'Jewellers',
          reviewCount: '89',
          starCount: 3,
          typeIcon: AppImages.jewellery,
          badgeColors: [],
          badgeName: '',
          location: 'Chengan Palli Road, Aluva, Kochi, Kerala',
          contact: '+91 9565521331, +91 9546542133',
          opening: '08:00 am - 06:30 pm',
          banners: [
            AppImages.antaraCloths,
            AppImages.grafJewellers,
            AppImages.ashokaJewellwers,
          ],
          locationUrl:
              'https://www.google.com/maps/dir/?api=1&origin=Kochi,+Kerala&destination=Kakkanad,+Kerala&travelmode=driving',
        ),
        FeaturedShop(
          image: AppImages.antaraCloths,
          name: 'Antara Cloths',
          type: 'Textile',
          reviewCount: '125',
          starCount: 4,
          typeIcon: AppImages.textiles,
          badgeColors: [],
          badgeName: '',
          location: 'WF64+V7W, Achanpady, Piravom, Kerala 686664',
          contact: '+91 9565521331, +91 9546542133',
          opening: '08:00 am - 06:30 pm',
          banners: [
            AppImages.zudioShoppee,
            AppImages.grafJewellers,
            AppImages.ashokaJewellwers,
          ],
          locationUrl:
              'https://www.google.com/maps/dir/?api=1&origin=Kochi,+Kerala&destination=Kakkanad,+Kerala&travelmode=driving',
        ),
      ]);
    });
    isFeaturedShopsLoading.value = false;
    update();
  }

  void onCardTap(FeaturedShop details) {
    final shopCtrl = Get.put(ShopDetailsController());
    shopCtrl.shopDetails = details;
    Get.toNamed(AppScreen.shopDetails);
  }
}
