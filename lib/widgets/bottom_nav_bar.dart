import 'package:daily_exercises/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback press;
  final bool isActive;
  const BottomNavItem({
    required this.title,
    required this.icon,
    required this.press,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset("assets/icons/$icon.svg", color: isActive ? kActiveIconColor : kTextColor,),
          Text(title, style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),)
        ],
      ),
    );
  }
}