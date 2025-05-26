import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                          SizedBox(
                            width: 300,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
