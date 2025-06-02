import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class HideAndReportButton extends StatelessWidget {
  const HideAndReportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(AppColors.lightGreyColor),
          foregroundColor: WidgetStatePropertyAll(AppColors.blackColor),
        ),
        onPressed: () {},
        child: Text("Hide and Report"),
      ),
    );
  }
}
