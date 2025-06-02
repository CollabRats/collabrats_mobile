import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/discover_banner.dart';
import 'package:collabrats_mobile/widgets/hide_and_report_button.dart';
import 'package:collabrats_mobile/widgets/message_button.dart';
import 'package:collabrats_mobile/widgets/recommend_button.dart';
import 'package:collabrats_mobile/widgets/toggle_button.dart';
import 'package:collabrats_mobile/widgets/trusted_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_svg/svg.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int selectedTicket = 0;
  final List<String> gitFeat = [
    "Remote",
    "Contract Based",
    "\$400-\$500",
    "6 months",
  ];
  final List<String> requiredSkill = [
    "Networking",
    "Development",
    "Exploring",
    "Designing",
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
              text: "COMMUNITY",
              colorList: [Color(0xff9A1F1F), Color(0xffD24141)],
            ),
            const SizedBox(height: 15),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  "assets/images/gig.png",
                  fit: BoxFit.cover,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Posted 15 hr ago"), TrustedBadge()],
            ),
            const SizedBox(height: 5),
            Text(
              "Global Tech Innovation Submitt",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mollis nunc a molestie dictum.",
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset("assets/vectors/explore_nearby.svg"),
                const SizedBox(width: 5),
                Text("New Delhi, India"),
              ],
            ),
            const SizedBox(height: 15),
            Align(
              child: MessageButton(text: "Want to send personalized message?"),
            ),
            const SizedBox(height: 25),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Community Rating ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "4.5",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium!.copyWith(
                              fontSize: 29,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text("482 Reviews"),
                        ],
                      ),
                      const SizedBox(width: 5),
                      StarRating(
                        rating: 4.5,
                        size: 35,
                        color: Color(0xffFACC15),
                        allowHalfRating: true,
                        onRatingChanged: (rating) => setState(() => ()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About EduHub",
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
            const SizedBox(height: 25),
            Text(
              "Event Statistics",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.midGreyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$34.5",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 3),
                    Text("onwards"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      "500+",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 3),
                    Text("Seats Available"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "1.3k+",
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 3),
                    Text("Attendes"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Event Categories",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children:
                        requiredSkill
                            .map(
                              (val) => CustomCapsule(
                                text: val,
                                isSelected: true,
                                isSmall: true,
                                borderColor: Color(0xffDC2626),
                                bgColor: Color(0xffFEE2E2),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Previous Event Glimps",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.midGreyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 309,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Image.asset("assets/images/girl_2.png"),
                    ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(color: Color(0xffFAF9F6)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Posted By",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                          Theme.of(
                                            context,
                                          ).textTheme.headlineMedium,
                                    ),
                                    const SizedBox(width: 5),
                                    SvgPicture.asset(
                                      "assets/vectors/verified.svg",
                                    ),
                                  ],
                                ),
                                Text("HR at Info tech solutions"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mollis nunc a molestie dictum.",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Community Rules",
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
              decoration: BoxDecoration(color: Color(0xffFAF9F6)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Posted By",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
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
                                      Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
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
            ),
            const SizedBox(height: 25),
            ToggleButton(),
            const SizedBox(height: 15),
            RecommendButton(),
            const SizedBox(height: 10),
            HideAndReportButton(),
          ],
        ),
      ),
    );
  }
}
