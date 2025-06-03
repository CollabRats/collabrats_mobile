import 'package:collabrats_mobile/utils/colors.dart';

import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("Profile"),
        bottomOpacity: 0,
        elevation: 0,
        actions: [
          InkWell(onTap: () {}, child: Icon(IconsaxPlusLinear.setting_2)),
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0).copyWith(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 35),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Zendaya Chizimu",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(width: 5),
                          SvgPicture.asset("assets/vectors/verified.svg"),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.lightGreyColor,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Edit Profile",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  CustomCapsule(
                    text: "Play Plan",
                    isSelected: true,
                    textColor: AppColors.whiteColor,
                    bgColor: AppColors.blueColor,
                  ),
                  CustomCapsule(text: "Posts", isSelected: false),
                  CustomCapsule(text: "Saved", isSelected: false),
                ],
              ),
              const SizedBox(height: 25),
              Center(
                child: Container(
                  width: 320,
                  height: 165,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.lightPurple,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Collabrats Pro",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Get the special treatment, and enjoy better ways to connect with incredible people",
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff2248BB),
                        ),

                        child: Text(
                          "Explore Collabrats Pro",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium!.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What you get:",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 25),
                      Text("Unlimited Swipes"),
                      const SizedBox(height: 15),
                      Text("Priority Requests"),
                      const SizedBox(height: 15),
                      Text("Travel Mode"),
                      const SizedBox(height: 15),
                      Text("Advanced Filters"),
                      const SizedBox(height: 15),
                      Text("Visibility Boosts"),
                      const SizedBox(height: 15),
                      Text("Multiple Posts"),
                      const SizedBox(height: 15),
                      Text("Swipe History"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Free",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 25),
                      Text(""),
                      const SizedBox(height: 15),
                      Text("✓"),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Text(""),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Plus",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 25),
                      Text(""),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Text(""),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pro",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 25),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                      const SizedBox(height: 15),
                      Icon(IconsaxPlusBold.tick_circle),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
