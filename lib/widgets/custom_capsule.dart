import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomCapsule extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool hasCross;
  const CustomCapsule({
    super.key,
    required this.text,
    required this.isSelected,
    this.hasCross = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
