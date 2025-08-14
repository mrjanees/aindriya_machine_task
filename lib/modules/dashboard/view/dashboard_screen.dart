import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/core/constants/images.dart';
import 'package:webwork_task/core/constants/values.dart';
import 'package:webwork_task/modules/dashboard/controller/dashboard_ctrl.dart';
import 'package:webwork_task/widgets/custom_background.dart';
import 'package:webwork_task/widgets/custom_bottom_bar.dart';
import 'package:webwork_task/widgets/custom_image.dart';
import 'package:webwork_task/widgets/custom_shop_card.dart';
import 'package:webwork_task/widgets/custom_svg.dart';
import 'package:webwork_task/widgets/custom_text.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashBoardController>();
    return Scaffold(
        body: CustomBackground(
            removeBottomDesign: true,
            child: RefreshIndicator(
              onRefresh: () {
                return controller.featuredShops();
              },
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 60.h, left: kSpace, right: kSpace),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.all(1.5), // Border thickness
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.whiteColor, // Border color
                              width: 3, // Border width
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(AppImages.person),
                          ),
                        ),
                        _currentLocation()
                      ],
                    ),
                    const SizedBox(
                      height: kSpace,
                    ),
                    _searchShop(),
                    const SizedBox(
                      height: kSpace,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _coinsAnalyst(),
                        const IntrinsicHeight(
                            child: SizedBox(
                                height: 100,
                                child: VerticalDivider(
                                  color: AppColors.whiteColor,
                                ))),
                        _qrScanner()
                      ],
                    ),
                    const SizedBox(
                      height: kSpace,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CustomImage(imageName: AppImages.superPromo),
                    ),
                    const CategoryHeading(
                      text: 'Top Categories',
                    ),
                    _topCategories(),
                    const CategoryHeading(
                      text: "Featured Shops",
                    ),
                    _featuredShops(controller),
                    const CategoryHeading(
                      text: "Nearby Shops",
                    ),
                    _featuredShops(controller),
                  ],
                ),
              ),
            )),
        bottomNavigationBar: const CustomBottomBar());
  }

  Widget _currentLocation() {
    return InkWell(
      onTap: () {},
      child: Material(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.locator),
                const SizedBox(
                  width: kSpace,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Kakkanad',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    CustomText(
                      'Chittethukara, Kerala 652 565',
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                    )
                  ],
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            )),
      ),
    );
  }

  Widget _searchShop() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(colors: [
            AppColors.whiteColor,
            AppColors.whiteColor.withOpacity(.3)
          ])),
      child: TextField(
        controller: TextEditingController(),
        style: const TextStyle(color: AppColors.primaryColor),
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: CustomSvgImage(
                svgName: AppImages.search,
              ),
            ),
            suffixIconConstraints: const BoxConstraints.tightFor(),
            contentPadding: const EdgeInsets.only(left: kSpace, top: 4),
            hintText: "Search Shop Here...",
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w300, fontFamily: "ROBOTO"),
            counterText: "",
            border: InputBorder.none,
            enabledBorder: InputBorder.none),
      ),
    );
  }

  Widget _coinsAnalyst() {
    const totalCoins = 14325;
    const redeemableCoins = 9216;
    const expiredCoins = 6542;

    return Container(
      padding: const EdgeInsets.all(kSpace),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primaryColor, AppColors.secondaryColor])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            'Total Coin Balance',
            color: AppColors.whiteColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w300,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: totalCoins),
                duration: const Duration(seconds: 10),
                builder: (context, value, child) => CustomText(
                  value.toString(),
                  fontSize: 30.sp,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 8.w),
              CustomImage(imageName: AppImages.coin)
            ],
          ),
          SizedBox(
            width: 130.w,
            child: Divider(
              color: Colors.white.withOpacity(0.5),
              thickness: 1,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _animatedCoinColumn("Redeemable", redeemableCoins),
              const SizedBox(width: kSpace),
              _animatedCoinColumn("Expired", expiredCoins),
            ],
          )
        ],
      ),
    );
  }

  Widget _animatedCoinColumn(String title, int count) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title,
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.whiteColor),
          Row(
            children: [
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: count),
                duration: const Duration(seconds: 10),
                builder: (context, value, child) => CustomText(
                  value.toString(),
                  color: AppColors.whiteColor,
                ),
              ),
              CustomImage(imageName: AppImages.coin)
            ],
          ),
        ],
      );

  Widget _qrScanner() {
    return Container(
        padding: const EdgeInsets.symmetric(
            vertical: kSpace * 1.8, horizontal: kSpace * 2.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.whiteColor.withOpacity(.5)),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(kSpace),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      offset: const Offset(0, 4), // X=0, Y=4 → bottom shadow
                      blurRadius: 8, // Softness
                      spreadRadius: 1, // Slight spread
                    ),
                  ],
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryColor,
                        AppColors.secondaryColor
                      ])),
              child: Center(
                child: CustomSvgImage(svgName: AppImages.scanner),
              )),
        ));
  }

  Widget _topCategories() {
    return Wrap(
        spacing: 8,
        children: topCategory
            .map((category) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(kSpace),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              offset: const Offset(
                                  0, 3), // X=0, Y=4 → bottom shadow
                              blurRadius: 4, // Softness
                              spreadRadius: .5, // Slight spread
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.r),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryColor,
                                AppColors.secondaryColor
                              ])),
                      child: CustomSvgImage(svgName: category.image),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      category.name,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    )
                  ],
                ))
            .toList());
  }

  Widget _featuredShops(DashBoardController controller) {
    return Obx(
      () => GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: controller.isFeaturedShopsLoading.value
            ? 4
            : controller.featuredShopsList.length,
        itemBuilder: (context, index) {
          if (controller.isFeaturedShopsLoading.value) {
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
            final shop = controller.featuredShopsList[index];
            return ShopCard(
              shopDetails: shop,
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
    return Column(
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
    );
  }
}
