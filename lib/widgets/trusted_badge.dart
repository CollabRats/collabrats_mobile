import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrustedBadge extends StatelessWidget {
  const TrustedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffF1F7FF),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/vectors/verified_user.svg", height: 20),
          Text(
            "  Trusted by collabrats",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.blueColor),
          ),
        ],
      ),
    );
  }
}
