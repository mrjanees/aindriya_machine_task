import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webwork_task/core/constants/colors.dart';
import 'package:webwork_task/modules/dashboard/controller/dashboard_ctrl.dart';
import 'package:webwork_task/modules/dashboard/model/featured_shop.dart';
import 'package:webwork_task/widgets/custom_svg.dart';
import 'package:webwork_task/widgets/custom_text.dart';

class ShopCard extends StatelessWidget {
  final FeaturedShop shopDetails;

  const ShopCard({
    super.key,
    required this.shopDetails,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashBoardController>();
    return InkWell(
      onTap: () {
        controller.onCardTap(shopDetails);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    shopDetails.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (shopDetails.badgeName.isNotEmpty)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors:shopDetails. badgeColors),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: CustomText(
                      shopDetails.  badgeName,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomText(
              shopDetails.name,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            // Category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  CustomSvgImage(
                    svgName:shopDetails. typeIcon,
                    height: 20.h,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 4),
                  CustomText(
                    shopDetails.type,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),

            // Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating:shopDetails.starCount.toDouble(),
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
                    "(${shopDetails.reviewCount})",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
