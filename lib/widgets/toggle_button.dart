import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtils.screenHeight * .19,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/vectors/Super Like.svg"),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/vectors/Dislike.svg"),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/vectors/Like.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
