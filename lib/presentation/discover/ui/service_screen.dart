import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/discover_banner.dart';
import 'package:collabrats_mobile/widgets/hide_and_report_button.dart';
import 'package:collabrats_mobile/widgets/message_button.dart';
import 'package:collabrats_mobile/widgets/recommend_button.dart';
import 'package:collabrats_mobile/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
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
              text: "SERVICE",
              colorList: [Color(0xffAB2F8E), Color(0xffDF5AC0)],
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
              children: [Text("Posted 15 hr ago")],
            ),
            const SizedBox(height: 5),
            Text(
              "I design Logos for startups",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(radius: 12),
                const SizedBox(width: 5),
                Text("Anjali Ansari"),
              ],
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
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                CustomCapsule(
                  text: "On-time",
                  isSmall: true,
                  isSelected: true,
                  borderColor: Color(0xffDB2777),
                  bgColor: Color(0xffFCE7F3),
                ),
                CustomCapsule(
                  text: "Remote",
                  isSmall: true,
                  isSelected: true,
                  borderColor: Color(0xffDB2777),
                  bgColor: Color(0xffFCE7F3),
                ),
                CustomCapsule(
                  text: "\$500-\$900",
                  isSmall: true,
                  isSelected: true,
                  borderColor: Color(0xffDB2777),
                  bgColor: Color(0xffFCE7F3),
                ),
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
                    "About Service",
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
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Package",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.midGreyColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
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
                                            index == 0 ? "Basic" : "Standard",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.headlineSmall!.copyWith(
                                              color: AppColors.blueColor,
                                            ),
                                          ),
                                          Text(
                                            index == 0 ? "₹200" : "₹800",
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
            Container(
              decoration: BoxDecoration(color: Color(0xffFAF9F6)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            ),

            const SizedBox(height: 25),
            SizedBox(
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
                                borderColor: Color(0xffDB2777),
                                bgColor: Color(0xffFCE7F3),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            const SizedBox(height: 15),
            Text(
              "My Portfolio",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.midGreyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightGreyColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: 110,
                                  height: 100,
                                  child: Image.asset(
                                    "assets/images/girl.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kudos Home",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.headlineSmall,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "I have designed the more than 8 product creatives for Kudos Home that has been uploaded on Amazon.ca",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                    ),
                                  ],
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
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms and Conditions",
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
            ToggleButton(),
            const SizedBox(height: 15),
            RecommendButton(),
            const SizedBox(height: 10),
            HideAndReportButton(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
