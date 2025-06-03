import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _addSkills = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int professionalIndex = -1;
  int employmentIndex = -1;
  bool isChecked = false;
  List<String> skills = [];
  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Post Job",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset("assets/vectors/cross.svg"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),

                  CustomTextFormfield(
                    hintText: "Enter Job Title",
                    headText: "Job Title",
                    controller: _jobTitle,
                    validator:
                        (val) => Validators.validateEmptyField(
                          val ?? "",
                          "Job Title",
                        ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormfield(
                    hintText: "Enter Company Name",
                    headText: "Company Name",
                    controller: _jobTitle,
                    validator:
                        (val) => Validators.validateEmptyField(
                          val ?? "",
                          "Company Name",
                        ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormfield(
                    hintText: "Enter Location (City, State)",
                    headText: "Location",
                    controller: _jobTitle,
                    validator:
                        (val) => Validators.validateEmptyField(
                          val ?? "",
                          "Location",
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Job Type",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _jobTypeWidget(),
                  const SizedBox(height: 20),
                  Text(
                    "Employment Type",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _employTypeWidget(),
                  const SizedBox(height: 20),
                  _salaryRange(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        "Open for salary negotiation",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormfield(
                    submittedText: (p0) {
                      if (!skills.contains(p0) && skills.length < 5) {
                        skills.add(p0);
                      }
                      _addSkills.clear();
                      setState(() {});
                    },
                    hintText: "Enter Skills & Requirement",
                    headText: "Skills & Requirement",
                    controller: _addSkills,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children:
                        skills
                            .map(
                              (val) => InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  skills.remove(val);
                                  setState(() {});
                                },
                                child: CustomCapsule(
                                  hasCross: true,
                                  text: val,
                                  isSelected: false,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormfield(
                    submittedText: (p0) {
                      if (!skills.contains(p0) && skills.length < 5) {
                        skills.add(p0);
                      }
                      _addSkills.clear();
                      setState(() {});
                    },
                    isDescp: true,
                    hintText: "About the role",
                    headText: "Add Job Description",
                    controller: _addSkills,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormfield(
                    isDescp: true,
                    submittedText: (p0) {
                      if (!skills.contains(p0) && skills.length < 5) {
                        skills.add(p0);
                      }
                      _addSkills.clear();
                      setState(() {});
                    },
                    hintText: "About the Company",
                    headText: "Add Company",
                    controller: _addSkills,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          showFab
              ? SizedBox(
                width: ScreenUtils.screenWidth * 0.85,
                child: CustomButton(text: "Post Job", function: () {}),
              )
              : null,
    );
  }

  Widget _salaryRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Salary Range",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: ScreenUtils.screenWidth * .4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.lightGreyColor,
              ),
              child: TextFormField(
                onFieldSubmitted: (value) {
                  setState(() {});
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: Theme.of(context).textTheme.bodyMedium!,
                cursorColor: AppColors.blackColor,
                enabled: true,
                decoration: InputDecoration(
                  hintText: "Min",
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.midGreyColor,
                  ),

                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: ScreenUtils.screenWidth * .4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.lightGreyColor,
              ),
              child: TextFormField(
                onFieldSubmitted: (value) {
                  setState(() {});
                },

                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: Theme.of(context).textTheme.bodyMedium!,
                cursorColor: AppColors.blackColor,
                enabled: true,
                decoration: InputDecoration(
                  hintText: "Max",
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.midGreyColor,
                  ),

                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _jobTypeWidget() {
    return Wrap(
      spacing: 20,
      direction: Axis.horizontal,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              professionalIndex = 0;
            });
          },
          child: CustomCapsule(
            text: "Remote",
            isSelected: professionalIndex == 0,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              professionalIndex = 1;
            });
          },
          child: CustomCapsule(
            text: "Hybrid",
            isSelected: professionalIndex == 1,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              professionalIndex = 2;
            });
          },
          child: CustomCapsule(
            text: "On-site",
            isSelected: professionalIndex == 2,
          ),
        ),
      ],
    );
  }

  Widget _employTypeWidget() {
    return Wrap(
      spacing: 20,
      direction: Axis.horizontal,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              employmentIndex = 0;
            });
          },
          child: CustomCapsule(
            text: "Full Time",
            isSelected: employmentIndex == 0,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              employmentIndex = 1;
            });
          },
          child: CustomCapsule(
            text: "Part Time",
            isSelected: employmentIndex == 1,
          ),
        ),
      ],
    );
  }
}
