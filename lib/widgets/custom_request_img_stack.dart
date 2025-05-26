import 'package:blur/blur.dart';
import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:flutter/material.dart';

class CustomRequestImgStack extends StatelessWidget {
  const CustomRequestImgStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Blur(blur: 4.5, child: Image.asset("assets/images/girl.png")),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                width: 70,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 5),
              CustomCapsule(
                text: "UI/UX Design",
                isSelected: false,
                isSmall: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
