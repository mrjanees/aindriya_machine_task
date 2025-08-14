import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/core/constants/images.dart';
import 'package:webwork_task/core/constants/values.dart';
import 'package:webwork_task/modules/dashboard/controller/dashboard_ctrl.dart';
import 'package:webwork_task/modules/dashboard/model/featured_shop.dart';
import 'package:webwork_task/modules/shop/controller/controller.dart';
import 'package:webwork_task/widgets/custom_background.dart';
import 'package:webwork_task/widgets/custom_bottom_bar.dart';
import 'package:webwork_task/widgets/custom_gradient_button.dart';
import 'package:webwork_task/widgets/custom_image.dart';
import 'package:webwork_task/widgets/custom_svg.dart';

import 'package:webwork_task/widgets/custom_text.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShopDetailsController>();
    final shopDetails = controller.shopDetails!;
    return Scaffold(
      body: CustomBackground(
          removeBottomDesign: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _shopGallery(controller),
                _shopDetails(shopDetails),
                _directionANDScanning(),
                Padding(
                  padding: const EdgeInsets.all(kSpace),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CustomImage(imageName: AppImages.summarSale),
                  ),
                ),
                const CategoryHeading(
                  text: 'Best Offers',
                ),
                _bestOffers(controller),
                const SizedBox(
                  height: kSpace * 2,
                )
              ],
            ),
          )),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }

  Widget _shopGallery(ShopDetailsController controller) {
    final shopDetails = controller.shopDetails!;
    return SizedBox(
      height: 250.h,
      child: Stack(
        children: [
          CarouselSlider(
            items: shopDetails.banners.map((banner) {
              return Container(
                width: double.infinity, // Make it full width
                decoration: const BoxDecoration(
                  color: AppColors.black,
                ),
                child: ClipRRect(
                  child: Image.asset(
                    banner,
                    fit: BoxFit.cover,
                    width: double.infinity, // Ensures image stretches
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 250.h,
              viewportFraction: 1, // Full screen width
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                controller.changeBannerImage(index);
              },
            ),
          ),
          Positioned(
              top: kSpace * 3,
              left: kSpace,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: AppColors.whiteColor.withOpacity(.8)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor,
                  ),
                ),
              )),
          Positioned(
            bottom: kSpace,
            right: 0,
            left: 0,
            child: Obx(() => Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.currentBannerIndex.value,
                    count: shopDetails.banners.length,
                    effect: ScrollingDotsEffect(
                      activeDotColor: AppColors.secondaryColor,
                      dotColor: Colors.white,
                      dotHeight: 8.h, // Height of the dot
                      dotWidth: 8.h, // Width must match height to be circular
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget _shopDetails(FeaturedShop shopDetails) {
    return Container(
      margin: const EdgeInsets.all(kSpace),
      width: double.infinity,
      padding: const EdgeInsets.all(kSpace),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: AppColors.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            shopDetails.name,
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
          Row(
            children: [
              CustomSvgImage(
                svgName: shopDetails.typeIcon,
                color: AppColors.secondaryColor,
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                shopDetails.type,
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
              )
            ],
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: shopDetails.starCount.toDouble(),
                itemSize: 12,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 12,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(width: 4),
              Text(
                "Ratings (${shopDetails.reviewCount})",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const SizedBox(
            height: kSpace,
          ),
          Row(
            children: [
              CustomSvgImage(svgName: AppImages.location),
              CustomText(
                " Location",
                color: const Color(0xFFFF4022),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              SizedBox(
                width: 50.w,
              ),
              Expanded(
                child: CustomText(
                  shopDetails.location,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              )
            ],
          ),
          const SizedBox(
            height: kSpace,
          ),
          Row(
            children: [
              CustomSvgImage(svgName: AppImages.contact),
              CustomText(
                " Contact",
                color: const Color(0xFF00930F),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              SizedBox(
                width: 50.w,
              ),
              Expanded(
                child: CustomText(
                  shopDetails.contact,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              )
            ],
          ),
          const SizedBox(
            height: kSpace,
          ),
          Row(
            children: [
              CustomSvgImage(svgName: AppImages.clock),
              CustomText(
                " Opening",
                color: const Color(0xFF7D81EA),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              SizedBox(
                width: 50.w,
              ),
              Expanded(
                child: CustomText(
                  shopDetails.opening,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _directionANDScanning() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomGradientButton(
            text: "Get Direction",
            onPress: () {},
            horizontalPadding: 20.w,
            icon: AppImages.getDirection,
            textColor: AppColors.primaryColor,
            colors: [
              AppColors.whiteColor,
              AppColors.whiteColor.withOpacity(.5)
            ],
            needShadow: true,
          ),
          CustomGradientButton(
            text: "Scan Your Bill",
            onPress: () {},
            icon: AppImages.scanner,
            horizontalPadding: 20.w,
            needShadow: true,
          )
        ],
      ),
    );
  }

  Widget _bestOffers(ShopDetailsController controller) {
    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.only(right: kSpace, left: kSpace),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: controller.isBestOffersLoading.value
            ? 4
            : controller.bestoffers.length,
        itemBuilder: (context, index) {
          if (controller.isBestOffersLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          } else {
            final offer = controller.bestoffers[index];
            return Container(
              padding: const EdgeInsets.all(kSpace),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    offset: const Offset(0, 3), // X=0, Y=4 → bottom shadow
                    blurRadius: 4, // Softness
                    spreadRadius: .5, // Slight spread
                  ),
                ],
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: offer.bgColors),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        offer.title,
                        fontSize: 26.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                        needShadow: true,
                        fontFamily: "MONTSERRAT",
                      ),
                      CustomText(
                        offer.subTitle,
                        fontSize: 18.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        needShadow: true,
                        fontFamily: "MONTSERRAT",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomSvgImage(svgName: AppImages.hourMedium),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                "Offer Valid Till",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.whiteColor,
                                fontFamily: "MONTSERRAT",
                              ),
                              CustomText(
                                offer.date,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteColor,
                                fontFamily: "MONTSERRAT",
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [CustomSvgImage(svgName: AppImages.info)],
                      )
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class CategoryHeading extends StatelessWidget {
  const CategoryHeading({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kSpace),
      child: Column(
        children: [
          const SizedBox(
            height: kSpace,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text,
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: kSpace,
          ),
        ],
      ),
    );
  }
}
