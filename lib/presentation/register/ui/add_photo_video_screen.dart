// ignore_for_file: use_build_context_synchronously
import 'package:collabrats_mobile/utils/presenters.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AddPhotoVideoScreen extends StatefulWidget {
  const AddPhotoVideoScreen({super.key});

  @override
  State<AddPhotoVideoScreen> createState() => _AddPhotoVideoScreenState();
}

class _AddPhotoVideoScreenState extends State<AddPhotoVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomRegisterHeader(
          hasSkip: true,
          imgPath: "assets/vectors/name.svg",
          progressValue: 11,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add your profile\nphoto or video",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
              ),
              const SizedBox(height: 15),
              Text(
                "You can add up to 1 photo or video",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              const SizedBox(height: 20),
              DottedBorder(
                color: Colors.black,
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
                      Icon(IconsaxPlusBold.cloud_add),
                      Text("click to select from device"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text("Supported formats: JPEG, PNG, MP4\nMax file size: 10MB"),
            ],
          ),
        ),
      ),

      floatingActionButton: CustomButton(text: "Continue", function: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
