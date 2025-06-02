import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostTile extends StatelessWidget {
  final String imgPath;
  final String headText;
  final String subText;
  final int colorCode;
  final void Function()? onTap;
  const PostTile({
    super.key,
    required this.imgPath,
    required this.headText,
    required this.subText,
    this.onTap,
    required this.colorCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(colorCode),
                      child: SvgPicture.asset(imgPath),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          headText,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subText,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.midGreyColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Icon(Icons.chevron_right_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
