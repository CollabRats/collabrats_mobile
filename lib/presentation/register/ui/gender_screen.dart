// ignore_for_file: use_build_context_synchronously

import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  bool isChecked = false;

  String? choice;

  void radioButtonChanges(String value) {
    setState(() {
      switch (value) {
        case 'Men':
          choice = value;
          break;
        case 'Women':
          choice = value;
          break;
        case 'Non Binary':
          choice = value;
          break;
        case 'Prefer not to Say':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRegisterHeader(
        imgPath: "assets/vectors/gender.svg",
        progressValue: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Which gender best\ndescribes you ?",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Men",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Radio<String>(
                      activeColor: AppColors.blueColor,
                      value: 'Men',
                      groupValue: choice,
                      onChanged: (value) => radioButtonChanges(value!),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Women",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Radio<String>(
                      activeColor: AppColors.blueColor,
                      value: 'Women',
                      groupValue: choice,
                      onChanged: (value) => radioButtonChanges(value!),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Non Binary",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Radio<String>(
                      activeColor: AppColors.blueColor,
                      value: 'Non Binary',
                      groupValue: choice,
                      onChanged: (value) => radioButtonChanges(value!),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prefer not to Say",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Radio<String>(
                      activeColor: AppColors.blueColor,
                      value: 'Prefer not to Say',
                      groupValue: choice,
                      onChanged: (value) => radioButtonChanges(value!),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),

            const SizedBox(height: 10),
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
          if (choice != null) Navigator.pushNamed(context, '/intention');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
