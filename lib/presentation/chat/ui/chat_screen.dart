import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/chat_tile.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> capsuleList = [
    "All",
    "Gigs",
    "Events",
    "Jobs",
    "Services",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chats",
                      style: Theme.of(context).textTheme.headlineMedium!,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/vectors/page_info.svg"),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        capsuleList
                            .map(
                              (val) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: CustomCapsule(
                                  text: val,
                                  isSelected: false,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Recent Collabs",
                  style: Theme.of(context).textTheme.headlineSmall!,
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        capsuleList
                            .map(
                              (val) => Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      Image.asset("assets/images/dp.png").image,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Messages",
                  style: Theme.of(context).textTheme.headlineSmall!,
                ),
                const SizedBox(height: 15),
                ListView.separated(
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder:
                      (context, index) => InkWell(
                        splashColor: AppColors.lightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.pushNamed(context, "/chatDetails");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ChatTile(
                            name: "Rishita Choudhary",
                            msg: "I thought it was you, lol.....",
                            imgPath: "",
                            time: "2 min ago",
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
