import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 38,
          width: 38,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blueColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset("assets/vectors/send_msg.svg"),
        ),
      ),
    );
  }
}
