import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRegisterHeader(
        hasSkip: true,
        imgPath: "assets/vectors/experience.svg",
        progressValue: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What’s your\nintentions ?",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),
            const SizedBox(height: 15),
            Text(
              "You can edit and add more experiences later ",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: ScreenUtils.screenWidth * 0.35,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  showMaterialModalBottomSheet(
                    backgroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,

                    builder:
                        (context) => StatefulBuilder(
                          builder: (
                            BuildContext context,
                            StateSetter setState,
                          ) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              height: ScreenUtils.screenHeight * .7,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: ScreenUtils.screenHeight * .02,
                                    ),
                                    CustomTextFormfield(
                                      isActive: true,
                                      headText: "Industry",
                                      hintText: "Industry Type",
                                      controller: TextEditingController(),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextFormfield(
                                      isActive: true,
                                      headText: "Position",
                                      hintText: "Enter job title",
                                      controller: TextEditingController(),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextFormfield(
                                      isActive: true,
                                      headText: "Company",
                                      hintText: "Enter Company Name",
                                      controller: TextEditingController(),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextFormfield(
                                      isActive: true,
                                      headText: "Description",
                                      hintText: "Add Description",
                                      controller: TextEditingController(),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextFormfield(
                                          isDate: true,
                                          isActive: true,
                                          headText: "Start Date",
                                          hintText: "MM/YYYY",
                                          controller: TextEditingController(),
                                        ),
                                        CustomTextFormfield(
                                          isDate: true,
                                          isActive: true,
                                          headText: "End Date",
                                          hintText: "MM/YYYY",
                                          controller: TextEditingController(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 24,
                                          width: 20,
                                          child: Checkbox(
                                            checkColor: AppColors.whiteColor,
                                            activeColor: AppColors.blueColor,
                                            value: isChecked,
                                            onChanged: (v) {
                                              setState(() {
                                                isChecked = v!;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "Currently working here",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    CustomButton(
                                      text: "Add Experience",
                                      function: () {},
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      IconsaxPlusLinear.add,
                      color: AppColors.blueColor,
                      size: 19,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Add Experience",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Continue",
        function: () {
          if (true) {
            Navigator.pushNamed(context, '/experience');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
