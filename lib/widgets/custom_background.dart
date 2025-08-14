import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:webwork_task/core/constants/colors.dart';

class CustomBackground extends StatelessWidget {
  CustomBackground(
      {super.key, required this.child, this.removeBottomDesign = false});
  final Widget child;
  bool removeBottomDesign;
  List<AuraSpot> auraSpots = [
    AuraSpot(
      color: const Color(0xFF9095FF),
      radius: 100,
      alignment: const Alignment(0.60, -0.75),
      blurRadius: 80,
    ),
    AuraSpot(
      color: const Color(0xFFFD7941),
      radius: 100,
      alignment: const Alignment(-0.80, -0.75),
      blurRadius: 120,
    ),
    AuraSpot(
      color: const Color(0xFF419DFD),
      radius: 100,
      alignment: const Alignment(0.60, -0.35),
      blurRadius: 100,
    ),
    AuraSpot(
      color: const Color(0xFF7D81EA),
      radius: 90,
      alignment: const Alignment(-0.50, 0.01),
      blurRadius: 60,
    ),
    AuraSpot(
      color: const Color(0xFFFD41BD),
      radius: 90,
      alignment: const Alignment(0.60, 0.45),
      blurRadius: 100,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AuraBox(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                AppColors.backgroundTop,
                AppColors.backgroundBottom,
              ])),
          spots: auraSpots,
          child: const SizedBox.expand(),
        ),
        child
      ],
    );
  }
}
