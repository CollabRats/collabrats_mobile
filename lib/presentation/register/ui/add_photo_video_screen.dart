// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/presenters.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';

import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_previewer/file_previewer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AddPhotoVideoScreen extends StatefulWidget {
  const AddPhotoVideoScreen({super.key});

  @override
  State<AddPhotoVideoScreen> createState() => _AddPhotoVideoScreenState();
}

class _AddPhotoVideoScreenState extends State<AddPhotoVideoScreen> {
  File? profilePicture;
  Widget? image;
  void pickProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: false,

      type: FileType.custom,
    );

    if (result != null) {
      PlatformFile pFile = result.files.first;
      File file = File(result.files.single.path!);
      if (pFile.size / 1024 > 5000) {
        Presenters.showSnackBar(context, "Max File size is 5MB");
      } else {
        final thumbnail = await FilePreview.getThumbnail(file.path);

        setState(() {
          image = thumbnail;
          profilePicture = file;
        });
        Presenters.showSnackBar(
          context,
          "File selected successfully",
          isSucess: true,
        );
      }
    } else {}
  }

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
                "Add your Profile Photo",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You can add up to 1 profile photo",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  ),
                  profilePicture != null
                      ? SizedBox(
                        height: 30,
                        child: IconButton(
                          onPressed: () {
                            profilePicture = null;
                            setState(() {});
                          },
                          icon: Icon(
                            IconsaxPlusLinear.profile_delete,
                            color: Colors.red,
                          ),
                        ),
                      )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 15),
              profilePicture == null
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
              const SizedBox(height: 25),
              Text("Supported formats: JPEG, PNG, JPG\nMax file size: 5MB"),
            ],
          ),
        ),
      ),

      floatingActionButton: CustomButton(text: "Continue", function: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
