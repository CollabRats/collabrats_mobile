import 'package:collabrats_mobile/data/register/data/add_education_model.dart';
import 'package:collabrats_mobile/presentation/register/bloc/add_education_cubit.dart';
import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:collabrats_mobile/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final TextEditingController _eduLevel = TextEditingController();
  final TextEditingController _fieldOfStudy = TextEditingController();
  final TextEditingController _schoolUni = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  void clearData() {
    setState(() {
      _eduLevel.clear();
      _fieldOfStudy.clear();
      _schoolUni.clear();
      _startDate.clear();
      _endDate.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEducationCubit, List<AddEducationModel>>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: CustomRegisterHeader(
              onSkip: () {
                Navigator.pushNamed(context, '/lookingFor');
              },
              hasSkip: true,
              imgPath: "assets/vectors/education.svg",
              progressValue: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tell us about your\neducation",
                    style:
                        Theme.of(context).textTheme.headlineLarge!.copyWith(),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "You can edit and add more education later",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          return CustomTile(
                            headText: state[index].schoolUniName,
                            subText1: state[index].fieldOfStudy,
                            startDate: state[index].startDate,
                            endDate: state[index].endDate,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: ScreenUtils.screenWidth * 0.35,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        clearData();
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
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height:
                                                  ScreenUtils.screenHeight *
                                                  .02,
                                            ),
                                            CustomTextFormfield(
                                              isActive: true,
                                              headText: "Education Level",
                                              hintText: "Enter education level",
                                              controller: _eduLevel,
                                              validator:
                                                  (val) =>
                                                      Validators.validateEmptyField(
                                                        val ?? '',
                                                        "Education Level",
                                                      ),
                                            ),
                                            const SizedBox(height: 10),
                                            CustomTextFormfield(
                                              isActive: true,
                                              headText: "Field of Study/Major",
                                              hintText: "Enter job title",
                                              controller: _fieldOfStudy,
                                              validator:
                                                  (val) =>
                                                      Validators.validateEmptyField(
                                                        val ?? '',
                                                        "Field of Study/Majo",
                                                      ),
                                            ),
                                            const SizedBox(height: 10),
                                            CustomTextFormfield(
                                              isActive: true,
                                              headText: "School/University",
                                              hintText: "Enter University Name",
                                              controller: _schoolUni,
                                              validator:
                                                  (val) =>
                                                      Validators.validateEmptyField(
                                                        val ?? '',
                                                        "School/University",
                                                      ),
                                            ),

                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomTextFormfield(
                                                  isDate: true,
                                                  isActive: true,
                                                  headText: "Start Date",
                                                  hintText: "MM/YYYY",
                                                  controller: _startDate,
                                                  validator:
                                                      (val) =>
                                                          Validators.validateStartDate(
                                                            val ?? '',
                                                          ),
                                                ),
                                                CustomTextFormfield(
                                                  isDate: true,
                                                  isActive:
                                                      isChecked ? false : true,
                                                  headText: "End Date",
                                                  hintText:
                                                      isChecked
                                                          ? "Present"
                                                          : "MM/YYYY",
                                                  controller: _endDate,
                                                  validator:
                                                      isChecked
                                                          ? null
                                                          : (val) =>
                                                              Validators.validateEndDate(
                                                                _startDate.text,
                                                                val ?? '',
                                                              ),
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
                                                    checkColor:
                                                        AppColors.whiteColor,
                                                    activeColor:
                                                        AppColors.blueColor,
                                                    value: isChecked,
                                                    onChanged: (v) {
                                                      setState(() {
                                                        isChecked = v!;
                                                        _endDate.text = "";
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
                                              text: "Add Qualification",
                                              function: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  Navigator.pop(context);
                                                  context
                                                      .read<AddEducationCubit>()
                                                      .addExp(
                                                        AddEducationModel(
                                                          educationLevel:
                                                              _eduLevel.text
                                                                  .trim(),
                                                          fieldOfStudy:
                                                              _fieldOfStudy.text
                                                                  .trim(),
                                                          schoolUniName:
                                                              _schoolUni.text
                                                                  .trim(),
                                                          startDate:
                                                              _startDate.text
                                                                  .trim(),
                                                          endDate:
                                                              _endDate.text
                                                                  .trim(),
                                                        ),
                                                      );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
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
                            "Add Education",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.blueColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          floatingActionButton:
              state.isNotEmpty
                  ? CustomButton(
                    text: "Continue",
                    function: () {
                      if (true) {
                        Navigator.pushNamed(context, '/lookingFor');
                      }
                    },
                  )
                  : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
