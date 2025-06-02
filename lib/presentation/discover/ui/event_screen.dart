import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/discover_banner.dart';
import 'package:collabrats_mobile/widgets/hide_and_report_button.dart';
import 'package:collabrats_mobile/widgets/message_button.dart';
import 'package:collabrats_mobile/widgets/recommend_button.dart';
import 'package:collabrats_mobile/widgets/toggle_button.dart';
import 'package:collabrats_mobile/widgets/trusted_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
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
              text: "EVENT",
              colorList: [Color(0xff63209A), Color(0xffC054C6)],
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
            const SizedBox(height: 5),
            Text("March 15, 2020 - March 16, 2020"),
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset("assets/vectors/explore_nearby.svg"),
                const SizedBox(width: 5),
                Text("New Delhi, India"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/vectors/alarm.svg"),
                const SizedBox(width: 5),
                Text("10:00 AM - 6:00 PM IST"),
              ],
            ),
            const SizedBox(height: 15),
            CustomCapsule(
              text: "In-Person Event",
              isSmall: true,
              isSelected: true,
              borderColor: Color(0xff9333EA),
              bgColor: Color(0xffF3E8FF),
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
                    "About Event",
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
                                borderColor: Color(0xff9333EA),
                                bgColor: Color(0xffF3E8FF),
                              ),
                            )
                            .toList(),
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
                    "Select Ticket",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ListView.builder(
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTicket = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color:
                                          index == selectedTicket
                                              ? AppColors.blueColor
                                              : AppColors.greyColor,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "General Administration",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.headlineSmall!.copyWith(
                                              color: AppColors.blueColor,
                                            ),
                                          ),
                                          Text(
                                            "₹200",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                  color: AppColors.blueColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "1) Lorem ipsum dolor sit amet\n2) Lorem ipsum dolor sit amet\n",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
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
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Additional Information",
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
