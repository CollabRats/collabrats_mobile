import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class RecommendButton extends StatelessWidget {
  const RecommendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blueColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Recommend to a friend",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.blueColor),
          ),
        ),
      ),
    );
  }
}
