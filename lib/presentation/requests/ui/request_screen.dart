import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_request_img_stack.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  int index = 0;
  final List<String> capsuleList = [
    "All",
    "Gigs",
    "Events",
    "Jobs",
    "Services",
  ];
  String selectedVal = '';

  bool isCollab = false;

  Widget itsACollab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        Center(
          child: SizedBox(
            width: 250,
            child: Image.asset("assets/images/collab.png"),
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircleAvatar(radius: 60), CircleAvatar(radius: 60)],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            "Time to discover new opportunities together",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 25),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "  Send a quick message",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.midGreyColor),
              ),
              Container(
                padding: EdgeInsets.all(5),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child:
              isCollab
                  ? itsACollab()
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "See who wants to collab",
                        style: Theme.of(context).textTheme.headlineLarge!,
                      ),
                      const SizedBox(height: 10),
                      index == 0
                          ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "They’re into you! If you’re into them too, like them back to match instantly",
                                style: Theme.of(context).textTheme.bodyMedium!,
                              ),
                              SizedBox(height: ScreenUtils.screenHeight * .2),
                              Center(
                                child: Image.asset(
                                  "assets/images/find_people.png",
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "You have no request pending, Swipe more to collab",
                                style: Theme.of(context).textTheme.bodyLarge!,
                              ),
                            ],
                          )
                          : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "They’re into you! If you’re into them too, like them back to match instantly",
                                style: Theme.of(context).textTheme.bodyMedium!,
                              ),
                              const SizedBox(height: 15),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children:
                                      capsuleList
                                          .map(
                                            (val) => GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedVal = val;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 12,
                                                ),
                                                child: CustomCapsule(
                                                  text: val,
                                                  isSelected:
                                                      val == selectedVal,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isCollab = true;
                                      });
                                    },
                                    child: CustomRequestImgStack(),
                                  ),
                                  CustomRequestImgStack(),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomRequestImgStack(),
                                  CustomRequestImgStack(),
                                ],
                              ),
                            ],
                          ),
                      const SizedBox(height: 15),
                      CustomButton(
                        text: index == 0 ? "Collab More" : "See who liked you",
                        function: () {
                          setState(() {
                            index = 1;
                          });
                        },
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
