import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_tile.dart';
import 'package:collabrats_mobile/widgets/message_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<String> lookingForList = [
    "Investment Partnerships",
    "Support",
    "Friends",
    "Tech Advisory Role",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("CollabRats"),
        bottomOpacity: 0,
        elevation: 0,
        actions: [Icon(IconsaxPlusBold.profile_circle, size: 30)],
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 320,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xff2422A4), Color(0xff3D3AE4)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PROFILE',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Stack(
                  children: [
                    Image.asset("assets/images/girl_2.png"),
                    Positioned(
                      bottom: 5,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCapsule(
                            text: "New Here",
                            isSelected: false,
                            isSmall: true,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Zendaya Chizimu",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(width: 5),
                              SvgPicture.asset("assets/vectors/verified.svg"),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "She/Her",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 315,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mollis nunc a molestie dictum. Mauris venenatis, felis scelerisque aliquet lacinia.",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/vectors/birthday.svg"),
                          const SizedBox(width: 5),
                          Text(
                            "20",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(color: AppColors.midGreyColor),
                    Row(
                      children: [
                        SvgPicture.asset("assets/vectors/name.svg"),
                        const SizedBox(width: 5),
                        Text(
                          "Female",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    VerticalDivider(color: AppColors.midGreyColor),
                    Row(
                      children: [
                        SvgPicture.asset("assets/vectors/school.svg"),
                        const SizedBox(width: 5),
                        Text(
                          "Student",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Divider(),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset("assets/vectors/experience.svg"),
                  const SizedBox(width: 10),
                  Text(
                    "CEO at Collabrats",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Divider(),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset("assets/vectors/school.svg"),
                  const SizedBox(width: 10),
                  Text(
                    "KIET Group of institutions",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Divider(),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset("assets/vectors/design_services.svg"),
                  const SizedBox(width: 10),
                  Text(
                    "Tech, Marketing, Education",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Divider(),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset("assets/vectors/home.svg"),
                  const SizedBox(width: 10),
                  Text(
                    "Ludhiyana, Punjab",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "Intentions",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.midGreyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: ScreenUtils.screenWidth * .36,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.blackColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/vectors/experience.svg"),
                        const SizedBox(width: 10),
                        Text("Yes"),
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtils.screenWidth * .5,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.blackColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/vectors/experience.svg"),
                        const SizedBox(width: 10),
                        Text("Open to it"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .23,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Bio",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Global business enthusiast on a mission to connect with great minds and collaborate with like minded people. Always ready for the next adventure whether it’s brainstorming innovating ideas  or exploring new horizons",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .23,
                decoration: BoxDecoration(color: Color(0xffFAF9F6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Looking For",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children:
                          lookingForList
                              .map(
                                (val) =>
                                    CustomCapsule(text: val, isSelected: false),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Daily Motivator",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "I want to change the lives of the people in the world",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .23,
                decoration: BoxDecoration(color: Color(0xffFAF9F6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Skills",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children:
                          lookingForList
                              .map(
                                (val) =>
                                    CustomCapsule(text: val, isSelected: false),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Myntra of success is",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Live and let live",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .23,
                decoration: BoxDecoration(color: Color(0xffFAF9F6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hobbies",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: [
                        CustomCapsule(text: "Cricket", isSelected: false),
                        CustomCapsule(text: "Designing", isSelected: false),
                      ],
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .23,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Education",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTile(
                      headText: "KIET Group of Institution",
                      subText1: "B. Tech",
                      startDate: "01/2020",
                      endDate: "",
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: ScreenUtils.screenHeight * .23,
                decoration: BoxDecoration(color: Color(0xffFAF9F6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Experience",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: AppColors.midGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomTile(
                      headText: "Software Developer",
                      subText1: "Google",
                      startDate: "01/2020",
                      endDate: "",
                    ),
                    const SizedBox(height: 5),
                    MessageButton(),
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
                        child: SvgPicture.asset(
                          "assets/vectors/Super Like.svg",
                        ),
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
                    foregroundColor: WidgetStatePropertyAll(
                      AppColors.blackColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Hide and Report"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
