import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String msg;
  final String imgPath;
  final String time;
  final String? noOfChats;
  const ChatTile({
    super.key,
    required this.name,
    required this.msg,
    required this.imgPath,
    required this.time,
    this.noOfChats,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: Image.asset("assets/images/dp.png").image,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Text(
                    msg,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.midGreyColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
                child: Text(
                  time,
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
              ),
              SizedBox(
                height: 25,
                child: Text(
                  "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.midGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
