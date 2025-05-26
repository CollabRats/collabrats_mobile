import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomCapsule extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool hasCross;
  final bool isSmall;
  const CustomCapsule({
    super.key,
    required this.text,
    required this.isSelected,
    this.hasCross = false,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 10 : 16,
        vertical: isSmall ? 4 : 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        border: Border.all(
          color: isSelected ? AppColors.blueColor : AppColors.midPurple,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text("$text${hasCross ? "    X" : ""}"),
    );
  }
}
