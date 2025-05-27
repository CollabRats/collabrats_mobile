import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_tile.dart';
import 'package:collabrats_mobile/widgets/discover_banner.dart';
import 'package:collabrats_mobile/widgets/message_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class GigScreen extends StatefulWidget {
  const GigScreen({super.key});

  @override
  State<GigScreen> createState() => _GigScreenState();
}

class _GigScreenState extends State<GigScreen> {
  final List<String> gitFeat = [
    "Remote",
    "Contract Based",
    "\$400-\$500",
    "6 months",
  ];
  final List<String> requiredSkill = [
    "Figam",
    "Adobe XD",
    "Wireframing",
    "Design",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DiscoverBanner(
              text: "GIG",
              colorList: [Color(0xff4AD2B0), Color(0xff29AFDB)],
            ),
            const SizedBox(height: 15),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("assets/images/gig.png"),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Posted 5 hr ago"),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF1F7FF),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/vectors/verified_user.svg",
                        height: 20,
                      ),
                      Text(
                        "  Trusted by collabrats",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              "UX/UI Designer for app and website Redesign",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("Info Tech Solutions Pvt. Lmt."),
            const SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.asset("assets/vectors/location.svg"),
                const SizedBox(width: 5),
                Text("New Delhi, India"),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children:
                  gitFeat
                      .map(
                        (val) => CustomCapsule(
                          text: val,
                          isSelected: true,
                          borderColor: Color(0xff0891B2),
                          bgColor: Color(0xffCFFAFE),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 10),
            Align(
              child: MessageButton(text: "Want to send personalized message?"),
            ),
            const SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: ScreenUtils.screenHeight * .18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Job Description",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Global business enthusiast on a mission to connect with great minds and collaborate with like minded people. Always ready for the next adventure whether it’s brainstorming innovating ideas  or exploring new horizons",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: ScreenUtils.screenHeight * .1,
              decoration: BoxDecoration(color: Color(0xffFAF9F6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Budget",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(
                          color: AppColors.midGreyColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$200- \$500",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(IconsaxPlusLinear.like_dislike),
                      const SizedBox(width: 5),
                      Text("Open for budget negotiation"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: ScreenUtils.screenHeight * .17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Skills",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children:
                        requiredSkill
                            .map(
                              (val) => CustomCapsule(
                                text: val,
                                isSelected: true,
                                borderColor: Color(0xff0891B2),
                                bgColor: Color(0xffCFFAFE),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: ScreenUtils.screenHeight * .18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Requirements",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("• "),
                      Expanded(
                        child: Text(
                          "Design, code, and modify websites to ensure functionality and visual appeal.",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("• "),
                      Expanded(
                        child: Text(
                          "Design, code, and modify websites to ensure functionality and visual appeal.",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: ScreenUtils.screenHeight * .13,
              decoration: BoxDecoration(color: Color(0xffFAF9F6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Posted By",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(radius: 22),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Zendaya Chizimu",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(width: 5),
                              SvgPicture.asset("assets/vectors/verified.svg"),
                            ],
                          ),
                          Text("HR at Info tech solutions"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: ScreenUtils.screenHeight * .19,
              width: ScreenUtils.screenWidth * .9,
              child: Stack(
                children: [
                  Positioned(
                    left: ScreenUtils.screenWidth * .35,
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/vectors/Super Like.svg"),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/vectors/Dislike.svg"),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/vectors/Like.svg"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blackColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Recommend to a friend"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(
                    AppColors.lightGreyColor,
                  ),
                  foregroundColor: WidgetStatePropertyAll(AppColors.blackColor),
                ),
                onPressed: () {},
                child: Text("Hide and Report"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
