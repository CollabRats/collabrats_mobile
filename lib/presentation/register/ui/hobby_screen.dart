// ignore_for_file: use_build_context_synchronously
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class HobbyScreen extends StatefulWidget {
  const HobbyScreen({super.key});

  @override
  State<HobbyScreen> createState() => _HobbyScreenState();
}

class _HobbyScreenState extends State<HobbyScreen> {
  final TextEditingController _addSkills = TextEditingController();
  final TextEditingController _addInterest = TextEditingController();
  final TextEditingController _addHobbies = TextEditingController();

  List<String> skills = [];
  List<String> interests = [];
  List<String> hobbies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomRegisterHeader(
          imgPath: "assets/vectors/search.svg",
          progressValue: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add your skills,\ninterests & hobbies",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
              ),
              const SizedBox(height: 15),
              Text(
                "select up to 5 in each field",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormfield(
                      submittedText: (p0) {
                        if (!skills.contains(p0) && skills.length < 5) {
                          skills.add(p0);
                        }
                        _addSkills.clear();
                        setState(() {});
                      },
                      headText: "Add Skills",
                      hintText: "Select your skills",
                      controller: _addSkills,
                      keyboardType: TextInputType.name,
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
                    const SizedBox(height: 10),
                    CustomTextFormfield(
                      submittedText: (p0) {
                        if (!interests.contains(p0) && interests.length < 5) {
                          interests.add(p0);
                        }
                        _addInterest.clear();
                        setState(() {});
                      },
                      headText: "Add Interests",
                      hintText: "Select your interests",
                      keyboardType: TextInputType.name,
                      controller: _addInterest,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children:
                          interests
                              .map(
                                (val) => InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    interests.remove(val);
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
                    const SizedBox(height: 10),
                    CustomTextFormfield(
                      submittedText: (p0) {
                        if (!hobbies.contains(p0) && hobbies.length < 5) {
                          hobbies.add(p0);
                        }
                        _addHobbies.clear();
                        setState(() {});
                      },
                      headText: "Add Hobbies",
                      hintText: "Select your hobbies",
                      keyboardType: TextInputType.name,
                      controller: _addHobbies,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children:
                          hobbies
                              .map(
                                (val) => InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    hobbies.remove(val);
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
                  ],
                ),
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Continue",
        function: () {
          Navigator.pushNamed(context, '/photo');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
