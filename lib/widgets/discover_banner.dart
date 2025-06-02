import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class DiscoverBanner extends StatelessWidget {
  final String text;
  final List<Color> colorList;
  const DiscoverBanner({
    super.key,
    required this.text,
    required this.colorList,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
          gradient: LinearGradient(colors: colorList),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
