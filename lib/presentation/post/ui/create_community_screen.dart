import 'dart:io';
import 'package:collabrats_mobile/data/post/data/add_ticket_model.dart';
import 'package:collabrats_mobile/presentation/post/bloc/add_ticket_cubit.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  final TextEditingController _addSkills = TextEditingController();
  final TextEditingController _packageName = TextEditingController();
  final TextEditingController _packageDesc = TextEditingController();
  final TextEditingController _included = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _paymentModel = TextEditingController();
  final TextEditingController _projectTitle = TextEditingController();
  final TextEditingController _projectDescp = TextEditingController();
  final TextEditingController _addProjectLink = TextEditingController();

  final TextEditingController _eventTitle = TextEditingController();
  final TextEditingController _eventOragniserName = TextEditingController();
  final TextEditingController _eventLocation = TextEditingController();
  final TextEditingController _eventDate = TextEditingController();
  final TextEditingController _eventTime = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _addPackageFormKey = GlobalKey<FormState>();
  File? uploadFile;
  Widget? image;
  File? projectFile;
  Widget? projectPreview;

  void pickProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result != null) {
      // PlatformFile pFile = result.files.first;
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

  void pickProjectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result != null) {
      // PlatformFile pFile = result.files.first;
      File file = File(result.files.single.path!);

      final thumbnail = await FilePreview.getThumbnail(file.path);

      setState(() {
        projectPreview = thumbnail; // TODO
        projectFile = file;
      });
      Presenters.showSnackBar(
        context,
        "File selected successfully",
        isSucess: true,
      );
    } else {}
  }

  void clearTextControllers() {
    _packageDesc.clear();
    _packageName.clear();
    _included.clear();
    _price.clear();
    _paymentModel.clear();
    _projectTitle.clear();
    _projectDescp.clear();
    _addProjectLink.clear();
    projectFile = null;
  }

  void addPackage() {
    clearTextControllers();
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
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.all(20),
                height: ScreenUtils.screenHeight * .5,
                child: SingleChildScrollView(
                  child: Form(
                    key: _addPackageFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenUtils.screenHeight * .02),
                        CustomTextFormfield(
                          isActive: true,
                          headText: "Ticket Name",
                          hintText: "Enter Ticket name",
                          controller: _packageName,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Ticket Name",
                              ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormfield(
                          isActive: true,
                          headText: "Add Ticket Price",
                          hintText: "Add Price",
                          controller: _packageDesc,
                          keyboardType: TextInputType.number,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Price",
                              ),
                        ),

                        CustomTextFormfield(
                          isActive: true,
                          headText: "Add Description",
                          hintText: "Add Description",
                          controller: _included,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Description",
                              ),
                        ),

                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Add Ticket",
                          function: () {
                            if (_addPackageFormKey.currentState!.validate()) {
                              Navigator.pop(context);
                              context.read<AddTicketCubit>().addTicket(
                                AddTicketModel(
                                  ticketName: _packageName.text.trim(),
                                  ticketPrice: _packageDesc.text.trim(),
                                  addDescp: _included.text.trim(),
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
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  int professionalIndex = -1;
  int employmentIndex = -1;
  bool isChecked = false;
  bool isNegotationChecked = false;
  List<String> skills = [];
  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return BlocBuilder<AddTicketCubit, List<AddTicketModel>>(
      builder: (context, ticketList) {
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
                            "Create Community",
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
                        hintText: "Enter Community Name",
                        headText: "Community Name",
                        controller: _eventTitle,
                        validator:
                            (val) => Validators.validateEmptyField(
                              val ?? "",
                              "Community Name",
                            ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormfield(
                        isDescp: true,
                        hintText: "Add Community Description",
                        headText: "Community Description",
                        controller: _eventOragniserName,
                        validator:
                            (val) => Validators.validateEmptyField(
                              val ?? "",
                              "Description",
                            ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Community Type",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _serviceTypeWidget(),
                      const SizedBox(height: 20),
                      CustomTextFormfield(
                        hintText: "Enter maximum numbers of members",
                        headText: "Member Limit ",
                        controller: _eventLocation,
                        keyboardType: TextInputType.number,
                        validator:
                            (val) => Validators.validateEmptyField(
                              val ?? "",
                              "Location",
                            ),
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
                        hintText: "Add Community Categories",
                        headText: "Community Preferences",
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
                        isDescp: true,
                        hintText: "Add Guidelines and rules",
                        headText: "Community Rules",
                        controller: _addProjectLink,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Cover Photo",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
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
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Photo Gallery",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      imageFileList!.isNotEmpty
                          ? SizedBox(
                            height: 120,
                            child: ListView.builder(
                              itemCount: imageFileList!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (context, index) => InkWell(
                                    onTap: () {
                                      imageFileList!.remove(
                                        imageFileList![index],
                                      );
                                      Presenters.showSnackBar(
                                        context,
                                        "Image removed",
                                      );
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: SizedBox(
                                        child: Image.file(
                                          File(imageFileList![index].path),
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                          )
                          : const SizedBox.shrink(),
                      InkWell(
                        onTap: selectImages,
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
                                Text("Click to select from device"),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
              showFab
                  ? SizedBox(
                    width: ScreenUtils.screenWidth * 0.85,
                    child: CustomButton(
                      text: "Create Community",
                      function: () {},
                    ),
                  )
                  : null,
        );
      },
    );
  }

  Widget _serviceTypeWidget() {
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
            text: "Public",
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
            text: "Private",
            isSelected: professionalIndex == 1,
          ),
        ),
      ],
    );
  }
}
