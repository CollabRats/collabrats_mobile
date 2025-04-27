import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        automaticallyImplyLeading: false,
        toolbarHeight: ScreenUtils.screenHeight * .08,
        leadingWidth: ScreenUtils.screenWidth * .6,
        leading: Row(
          children: [
            const SizedBox(width: 20),
            CircleAvatar(
              radius: 20,
              backgroundImage: Image.asset("assets/images/dp.png").image,
            ),
            const SizedBox(width: 10),
            Text(
              "Rishita Choudhary",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            color: AppColors.whiteColor,
            onSelected: (value) {},
            borderRadius: BorderRadius.circular(20),
            elevation: 1,
            position: PopupMenuPosition.under,
            menuPadding: EdgeInsets.all(0),
            popUpAnimationStyle: AnimationStyle(curve: Curves.easeInExpo),
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  value: '/report',
                  child: Text(
                    "Report",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.midGreyColor,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: '/delete',
                  child: Text(
                    "Delete",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(color: Colors.red),
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert, color: AppColors.whiteColor),
          ),
        ],
      ),
      body: Chats(),
    );
  }
}

class Chats extends StatelessWidget {
  const Chats({super.key});

  final List<Message> messages = const [
    Message(
      text: "Sam, are you ready? 🤣😂",
      isSentByMe: false,
      time: "1:18 PM",
    ),
    Message(text: "Actually yes, lemme see..", isSentByMe: true),
    Message(text: "Lets meet at the cafe around 5 PM today", isSentByMe: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              if (!message.isSentByMe) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Today", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message.text,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        message.time ?? '',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                );
              } else {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            message.text,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.done_all,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: AppColors.greyColor),
            ),
            child: Row(
              children: [
                const Icon(Icons.attach_file_rounded),
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    cursorHeight: 20,
                    cursorColor: AppColors.midGreyColor,
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      hintStyle: Theme.of(context).textTheme.bodyLarge!
                          .copyWith(color: AppColors.midGreyColor),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.blueColor),
                  ),
                  child: Icon(IconsaxPlusLinear.send_2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;
  final String? time;

  const Message({required this.text, required this.isSentByMe, this.time});
}
