import 'package:webwork_task/core/constants/images.dart';
import 'package:webwork_task/modules/dashboard/model/top_categories.dart';

const double kSpace = 16;

List<TopCategories> topCategory = [
  TopCategories(image: AppImages.textiles, name: 'Textiles'),
  TopCategories(image: AppImages.jewellery, name: 'Jewellery'),
  TopCategories(image: AppImages.furniture, name: 'Furniture'),
  TopCategories(image: AppImages.superMarket, name: 'Supermarket'),
  TopCategories(image: AppImages.restaurant, name: 'Restaurant'),
];

List<String> bottomBaritems = [
  AppImages.home,
  AppImages.category,
  AppImages.gift,
  AppImages.profile
];
