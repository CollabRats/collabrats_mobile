import 'package:collabrats_mobile/data/register/data/add_experience_model.dart';
import 'package:collabrats_mobile/presentation/register/bloc/add_experience_cubit.dart';
import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/data/input_fields.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:collabrats_mobile/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final TextEditingController _industry = TextEditingController();
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  void clearData() {
    setState(() {
      _industry.clear();
      _jobTitle.clear();
      _companyName.clear();
      _description.clear();
      _startDate.clear();
      _endDate.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExperienceCubit, List<AddExperienceModel>>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: CustomRegisterHeader(
              onSkip: () {
                Navigator.pushNamed(context, '/education');
              },
              hasSkip: true,
              imgPath: "assets/vectors/experience.svg",
              progressValue: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tell us about your\nprofessional\nexperience",
                    style:
                        Theme.of(context).textTheme.headlineLarge!.copyWith(),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "You can edit and add more experiences later ",
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
                            headText: state[index].company,
                            subText1: state[index].position,
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
                                            // TypeAheadField(
                                            //   showOnFocus: true,
                                            //   autoFlipMinHeight: 1,
                                            //   hideWithKeyboard: true,
                                            //   controller: _industry,
                                            //   hideOnEmpty: true,

                                            //   suggestionsCallback: (
                                            //     String search,
                                            //   ) {
                                            //     return InputFields.getSuggestions(
                                            //       search,
                                            //       InputFields.industryTypes,
                                            //     );
                                            //   },
                                            //   itemBuilder: (
                                            //     context,
                                            //     String suggestions,
                                            //   ) {
                                            //     return ListTile(
                                            //       title: Text(suggestions),
                                            //     );
                                            //   },
                                            //   onSelected: (String value) {
                                            //     setState(() {
                                            //       _industry.text = value;
                                            //     });
                                            //   },

                                            //   builder:
                                            //       (
                                            //         context,
                                            //         contlr,
                                            //         focusNode,
                                            //       ) => TextField(
                                            //         controller: contlr,
                                            //         focusNode: focusNode,
                                            //         autofocus: true,
                                            //         decoration: InputDecoration(
                                            //           border:
                                            //               OutlineInputBorder(),
                                            //           labelText: 'City',
                                            //         ),
                                            //       ),
                                            // ),
                                            const SizedBox(height: 10),
                                            CustomTextFormfield(
                                              isActive: true,
                                              headText: "Position",
                                              hintText: "Enter job title",
                                              controller: _jobTitle,
                                              validator:
                                                  (val) =>
                                                      Validators.validateEmptyField(
                                                        val ?? '',
                                                        "Position",
                                                      ),
                                            ),
                                            CustomTextFormfield(
                                              isActive: true,
                                              headText: "Industry",
                                              hintText: "Industry Type",
                                              controller: _industry,

                                              validator:
                                                  (val) =>
                                                      Validators.validateEmptyField(
                                                        val ?? '',
                                                        "Industry",
                                                      ),
                                            ),
                                            const SizedBox(height: 10),
                                            CustomTextFormfield(
                                              isActive: true,
                                              headText: "Company",
                                              hintText: "Enter Company Name",
                                              controller: _companyName,
                                              validator:
                                                  (val) =>
                                                      Validators.validateEmptyField(
                                                        val ?? '',
                                                        "Company",
                                                      ),
                                            ),
                                            const SizedBox(height: 10),
                                            CustomTextFormfield(
                                              isActive: true,
                                              headText: "Description",
                                              hintText: "Add Description",
                                              controller: _description,
                                              validator:
                                                  (val) =>
                                                      Validators.validateEmptyField(
                                                        val ?? '',
                                                        "Description",
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
                                              text: "Add Experience",
                                              function: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  Navigator.pop(context);
                                                  context
                                                      .read<
                                                        AddExperienceCubit
                                                      >()
                                                      .addExp(
                                                        AddExperienceModel(
                                                          industry:
                                                              _industry.text
                                                                  .trim(),
                                                          position:
                                                              _jobTitle.text
                                                                  .trim(),
                                                          company:
                                                              _companyName.text
                                                                  .trim(),
                                                          description:
                                                              _description.text
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
                                            const SizedBox(height: 10),
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
                            "Add Experience",
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
                        Navigator.pushNamed(context, '/education');
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
