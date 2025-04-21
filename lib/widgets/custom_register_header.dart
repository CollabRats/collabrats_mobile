import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRegisterHeader extends StatefulWidget {
  final Widget child;
  final double progressValue;
  final String imgPath;
  final bool hasSkip;
  final void Function()? onSkip;
  const CustomRegisterHeader({
    super.key,
    required this.child,
    required this.progressValue,
    required this.imgPath,
    this.hasSkip = false,
    this.onSkip,
  });

  @override
  State<CustomRegisterHeader> createState() => _CustomRegisterHeaderState();
}

class _CustomRegisterHeaderState extends State<CustomRegisterHeader> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.hasSkip
                ? Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: widget.onSkip,
                    child: Text(
                      "Skip for later",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.midGreyColor,
                      ),
                    ),
                  ),
                )
                : const SizedBox.shrink(),
            SizedBox(
              height:
                  widget.hasSkip
                      ? ScreenUtils.screenHeight * 0.07
                      : ScreenUtils.screenHeight * .1,
            ),
            SizedBox(
              height: 40,
              child: DashedCircularProgressBar.aspectRatio(
                aspectRatio: 1,
                valueNotifier: _valueNotifier,
                progress: widget.progressValue,
                maxProgress: 12,
                corners: StrokeCap.butt,
                foregroundColor: AppColors.blackColor,
                backgroundColor: AppColors.greyColor,
                foregroundStrokeWidth: 4,
                backgroundStrokeWidth: 4,
                backgroundGapSize: 20,
                animation: true,
                child: Center(
                  child: SvgPicture.asset(widget.imgPath, height: 13),
                ),
              ),
            ),
            const SizedBox(height: 10),
            widget.child,
          ],
        ),
      ),
    );
  }
}
