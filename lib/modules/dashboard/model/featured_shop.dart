import 'package:flutter/material.dart';

class FeaturedShop {
  String name;
  String image;
  String type;
  String reviewCount;
  int starCount;
  String typeIcon;
  String badgeName;
  String location;
  String locationUrl;
  String contact;
  String opening;
  List<String> banners;
  List<Color> badgeColors;
  FeaturedShop({
    required this.image,
    required this.name,
    required this.type,
    required this.reviewCount,
    required this.starCount,
    required this.typeIcon,
    required this.badgeColors,
    required this.badgeName,
    required this.location,
    required this.locationUrl,
    required this.contact,
    required this.opening,
    required this.banners,
  });
}
