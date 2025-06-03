import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageButton extends StatelessWidget {
  final String? text;
  const MessageButton({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(10),
          width: text == null ? null : ScreenUtils.screenWidth * .78,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blueColor),
            borderRadius: BorderRadius.circular(100),
          ),
          child:
              text != null
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset("assets/vectors/send_msg.svg"),
                      const SizedBox(width: 5),
                      Text(text!),
                    ],
                  )
                  : SvgPicture.asset("assets/vectors/send_msg.svg"),
        ),
      ),
    );
  }
}
