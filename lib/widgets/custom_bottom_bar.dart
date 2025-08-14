import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webwork_task/core/constants/values.dart';
import 'package:webwork_task/widgets/custom_svg.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {},
        items: bottomBaritems
            .map((icon) => BottomNavigationBarItem(
                  icon: CustomSvgImage(svgName: icon),
                  label: '',
                ))
            .toList(),
      ),
    );
  }
}
