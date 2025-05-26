// ignore_for_file: use_build_context_synchronously

import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:flutter/material.dart';

class IntentionScreen extends StatefulWidget {
  const IntentionScreen({super.key});

  @override
  State<IntentionScreen> createState() => _IntentionScreenState();
}

class _IntentionScreenState extends State<IntentionScreen> {
  bool isChecked = false;
  int professionalIndex = -1;
  int causalIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRegisterHeader(
        imgPath: "assets/vectors/intentions.svg",
        progressValue: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What are your\nintentions ?",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),
            const SizedBox(height: 15),
            Text(
              "Professional",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
            ),
            const SizedBox(height: 10),
            _professionalWidget(),
            const SizedBox(height: 15),
            Text(
              "Casual",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
            ),
            const SizedBox(height: 10),
            _casualWidget(),
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
                  "Visible on profile",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Continue",
        function: () {
          if (professionalIndex != -1 && causalIndex != -1) {
            Navigator.pushNamed(context, '/experience');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _professionalWidget() {
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
          child: CustomCapsule(text: "Yes", isSelected: professionalIndex == 0),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              professionalIndex = 1;
            });
          },
          child: CustomCapsule(text: "No", isSelected: professionalIndex == 1),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              professionalIndex = 2;
            });
          },
          child: CustomCapsule(
            text: "Open to it",
            isSelected: professionalIndex == 2,
          ),
        ),
      ],
    );
  }

  Widget _casualWidget() {
    return Wrap(
      spacing: 20,
      direction: Axis.horizontal,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              causalIndex = 0;
            });
          },
          child: CustomCapsule(text: "Yes", isSelected: causalIndex == 0),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              causalIndex = 1;
            });
          },
          child: CustomCapsule(text: "No", isSelected: causalIndex == 1),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              causalIndex = 2;
            });
          },
          child: CustomCapsule(
            text: "Open to it",
            isSelected: causalIndex == 2,
          ),
        ),
      ],
    );
  }
}
