import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/helpers/formatter.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String headText;
  final String subText1;
  final String startDate;
  final String endDate;
  const CustomTile({
    super.key,
    required this.headText,
    required this.subText1,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueAccent.withOpacity(0.3),
          border: Border.all(color: AppColors.greyColor),
        ),
        child: Text(
          headText[0],
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.blueColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      title: Text(headText, style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subText1, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            "${Formatters.formatToMonthYear(startDate)!} - ${Formatters.formatToMonthYear(endDate)!}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
