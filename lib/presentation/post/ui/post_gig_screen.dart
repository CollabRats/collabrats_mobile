import 'dart:io';

import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/presenters.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_previewer/file_previewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class PostGigScreen extends StatefulWidget {
  const PostGigScreen({super.key});

  @override
  State<PostGigScreen> createState() => _PostGigScreenState();
}

class _PostGigScreenState extends State<PostGigScreen> {
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _addSkills = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? uploadFile;
  Widget? image;
  void pickProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result != null) {
      PlatformFile pFile = result.files.first;
      File file = File(result.files.single.path!);

      final thumbnail = await FilePreview.getThumbnail(file.path);

      setState(() {
        image = thumbnail;
        uploadFile = file;
      });
      Presenters.showSnackBar(
        context,
        "File selected successfully",
        isSucess: true,
      );
    } else {}
  }

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
                        "Post Gig",
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
                    hintText: "Enter Gig Title",
                    headText: "Gig Title",
                    controller: _jobTitle,
                    validator:
                        (val) => Validators.validateEmptyField(
                          val ?? "",
                          "Gig Title",
                        ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormfield(
                    hintText: "Enter Name",
                    headText: "Your Name/Business Name",
                    controller: _jobTitle,
                    validator:
                        (val) =>
                            Validators.validateEmptyField(val ?? "", "Name"),
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
                    "Work Type",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _jobTypeWidget(),
                  const SizedBox(height: 20),
                  Text(
                    "Payment Type",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _employTypeWidget(),
                  const SizedBox(height: 20),
                  _budgetRange(),
                  CustomTextFormfield(
                    headText: "",
                    hintText: "Time Period",
                    controller: _addSkills,
                  ),
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
                        "Open for budget negotiation",
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
                    hintText: "Add Required Skills",
                    headText: "Other Details",
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
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Gig Cover Photo",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      uploadFile != null
                          ? SizedBox(
                            height: 30,
                            child: IconButton(
                              onPressed: () {
                                uploadFile = null;
                                setState(() {});
                              },
                              icon: Icon(
                                IconsaxPlusLinear.gallery_remove,
                                color: Colors.red,
                              ),
                            ),
                          )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  uploadFile == null
                      ? InkWell(
                        onTap: pickProfilePicture,
                        child: DottedBorder(
                          strokeWidth: 0.2,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(8),
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: ScreenUtils.screenWidth * .9,
                            padding: EdgeInsets.all(20),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload_outlined),
                                const SizedBox(height: 5),
                                // Icon(IconsaxPlusBold.cloud_add),
                                Text("Click to select from device"),
                              ],
                            ),
                          ),
                        ),
                      )
                      : InkWell(
                        onTap: pickProfilePicture,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: ScreenUtils.screenHeight * .3,
                          width: ScreenUtils.screenWidth * .9,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.blueColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: image,
                        ),
                      ),
                  CustomTextFormfield(
                    isDescp: true,
                    hintText: "Describe what all you need to be done",
                    headText: "",
                    controller: _addSkills,
                  ),
                  CustomTextFormfield(
                    isDescp: true,
                    hintText: "About yourself/your business",
                    headText: "",
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
                child: CustomButton(text: "Post Gig", function: () {}),
              )
              : null,
    );
  }

  Widget _budgetRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Budget Range",
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
            text: "Contract Basis",
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
            text: "Hourly basis",
            isSelected: employmentIndex == 1,
          ),
        ),
      ],
    );
  }
}
