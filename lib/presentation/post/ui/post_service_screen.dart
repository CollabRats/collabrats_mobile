import 'dart:io';
import 'package:collabrats_mobile/data/post/data/add_package_model.dart';
import 'package:collabrats_mobile/data/post/data/add_project_model.dart';
import 'package:collabrats_mobile/presentation/post/bloc/add_package_cubit.dart';
import 'package:collabrats_mobile/presentation/post/bloc/add_project_cubit.dart';
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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PostServiceScreen extends StatefulWidget {
  const PostServiceScreen({super.key});

  @override
  State<PostServiceScreen> createState() => _PostServiceScreenState();
}

class _PostServiceScreenState extends State<PostServiceScreen> {
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _addSkills = TextEditingController();
  final TextEditingController _packageName = TextEditingController();
  final TextEditingController _packageDesc = TextEditingController();
  final TextEditingController _included = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _paymentModel = TextEditingController();
  final TextEditingController _projectTitle = TextEditingController();
  final TextEditingController _projectDescp = TextEditingController();
  final TextEditingController _addProjectLink = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _addPackageFormKey = GlobalKey<FormState>();
  final _addProjectFormKey = GlobalKey<FormState>();
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

  void addProject() {
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
                height: ScreenUtils.screenHeight * .65,
                child: SingleChildScrollView(
                  child: Form(
                    key: _addProjectFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenUtils.screenHeight * .02),
                        CustomTextFormfield(
                          isActive: true,
                          headText: "Project Title",
                          hintText: "Enter project title",
                          controller: _projectTitle,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Title",
                              ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormfield(
                          isActive: true,
                          headText: "Project Description",
                          hintText: "Enter project description",
                          controller: _projectDescp,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Project Description",
                              ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormfield(
                          isActive: true,
                          headText: "Add Project Link",
                          hintText: "Add link",
                          controller: _addProjectLink,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Link",
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Add Project Cover Photos",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        projectFile == null
                            ? InkWell(
                              onTap: () async {
                                FilePickerResult? result = await FilePicker
                                    .platform
                                    .pickFiles(allowMultiple: false);

                                if (result != null) {
                                  // PlatformFile pFile = result.files.first;
                                  File file = File(result.files.single.path!);

                                  final thumbnail =
                                      await FilePreview.getThumbnail(file.path);

                                  setState(() {
                                    projectPreview = thumbnail;
                                    projectFile = file;
                                  });
                                  Presenters.showSnackBar(
                                    context,
                                    "File selected successfully",
                                    isSucess: true,
                                  );
                                } else {}
                              },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                              onTap: () async {
                                FilePickerResult? result = await FilePicker
                                    .platform
                                    .pickFiles(allowMultiple: false);

                                if (result != null) {
                                  // PlatformFile pFile = result.files.first;
                                  File file = File(result.files.single.path!);

                                  final thumbnail =
                                      await FilePreview.getThumbnail(file.path);

                                  setState(() {
                                    projectPreview = thumbnail;
                                    projectFile = file;
                                  });
                                  Presenters.showSnackBar(
                                    context,
                                    "File selected successfully",
                                    isSucess: true,
                                  );
                                } else {}
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: ScreenUtils.screenHeight * .3,
                                width: ScreenUtils.screenWidth * .9,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.blueColor,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: projectPreview,
                              ),
                            ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Add Project",
                          function: () {
                            if (_addProjectFormKey.currentState!.validate()) {
                              Navigator.pop(context);
                              context.read<AddProjectCubit>().addProject(
                                AddProjectModel(
                                  projectTitle: _projectTitle.text.trim(),
                                  projectDescp: _projectDescp.text.trim(),
                                  projectLink: _addProjectLink.text.trim(),
                                  image: projectPreview!,
                                  projectFile: projectFile!,
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
                height: ScreenUtils.screenHeight * .65,
                child: SingleChildScrollView(
                  child: Form(
                    key: _addPackageFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenUtils.screenHeight * .02),
                        CustomTextFormfield(
                          isActive: true,
                          headText: "Package Name",
                          hintText: "Enter package name",
                          controller: _packageName,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Package Name",
                              ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormfield(
                          isActive: true,
                          headText: "Package Description",
                          hintText: "Enter package description",
                          controller: _packageDesc,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Package Description",
                              ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormfield(
                          isActive: true,
                          isDescp: true,
                          headText: "What’s Included in your service",
                          hintText:
                              "Your deliverables(Suggest to change write it in point)",
                          controller: _included,
                          validator:
                              (val) => Validators.validateEmptyField(
                                val ?? '',
                                "Service",
                              ),
                        ),

                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextFormfield(
                              isShort: true,
                              isActive: true,
                              keyboardType: TextInputType.number,
                              headText: "Price",
                              hintText: "Package Price",
                              controller: _price,
                              validator:
                                  (val) => Validators.validateEmptyField(
                                    val ?? '',
                                    "Price",
                                  ),
                            ),
                            PopupMenuButton(
                              color: AppColors.whiteColor,
                              onSelected: (value) {
                                setState(() {
                                  _paymentModel.text = value;
                                });
                              },
                              borderRadius: BorderRadius.circular(20),
                              elevation: 1,
                              position: PopupMenuPosition.under,
                              menuPadding: EdgeInsets.all(0),

                              popUpAnimationStyle: AnimationStyle(
                                curve: Curves.easeInExpo,
                              ),
                              itemBuilder: (BuildContext bc) {
                                return [
                                  PopupMenuItem(
                                    value: 'Per Hour',
                                    child: Text(
                                      "Per Hour",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall!.copyWith(
                                        color: AppColors.midGreyColor,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'Per Day',
                                    child: Text(
                                      "Per Day",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall!.copyWith(
                                        color: AppColors.midGreyColor,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'Per Project',
                                    child: Text(
                                      "Per Project",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall!.copyWith(
                                        color: AppColors.midGreyColor,
                                      ),
                                    ),
                                  ),
                                ];
                              },
                              child: CustomTextFormfield(
                                isShort: true,
                                isActive: false,
                                keyboardType: TextInputType.number,
                                headText: "Payment Model",
                                hintText: "Select Payment method",
                                controller: _paymentModel,
                                validator:
                                    (val) => Validators.validateEmptyField(
                                      val ?? '',
                                      "Payment",
                                    ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Add Package",
                          function: () {
                            if (_addPackageFormKey.currentState!.validate()) {
                              Navigator.pop(context);
                              context.read<AddPackageCubit>().addPackage(
                                AddPackageModel(
                                  packageName: _packageName.text.trim(),
                                  packageDescp: _packageDesc.text.trim(),
                                  included: _included.text.trim(),
                                  price: _price.text.trim(),
                                  paymentModel: _paymentModel.text.trim(),
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

  int professionalIndex = -1;
  int employmentIndex = -1;
  bool isChecked = false;
  bool isNegotationChecked = false;
  List<String> skills = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPackageCubit, List<AddPackageModel>>(
      builder: (context, packageList) {
        return BlocBuilder<AddProjectCubit, List<AddProjectModel>>(
          builder: (context, projectList) {
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
                                "Post Service",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: SvgPicture.asset(
                                  "assets/vectors/cross.svg",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          CustomTextFormfield(
                            hintText: "Enter Service Title",
                            headText: "Service Title",
                            controller: _jobTitle,
                            validator:
                                (val) => Validators.validateEmptyField(
                                  val ?? "",
                                  "Service Title",
                                ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormfield(
                            hintText: "Enter Service Description",
                            headText: "Description",
                            controller: _jobTitle,
                            validator:
                                (val) => Validators.validateEmptyField(
                                  val ?? "",
                                  "Name",
                                ),
                          ),

                          const SizedBox(height: 20),
                          Text(
                            "Service Type",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          _serviceTypeWidget(),
                          const SizedBox(height: 20),
                          Text(
                            "Service Mode",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          _employTypeWidget(),
                          const SizedBox(height: 20),
                          Text(
                            "Add Service Package",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          packageList.isNotEmpty
                              ? ListView.builder(
                                itemCount: packageList.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder:
                                    (context, index) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: AppColors.blueColor,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      packageList[index]
                                                          .packageName,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall!
                                                          .copyWith(
                                                            color:
                                                                AppColors
                                                                    .blueColor,
                                                          ),
                                                    ),
                                                    Text(
                                                      "₹${packageList[index].price}/${packageList[index].paymentModel.toLowerCase()}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                            color:
                                                                AppColors
                                                                    .blueColor,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  packageList[index].included,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: IconButton(
                                            onPressed: () {
                                              context
                                                  .read<AddPackageCubit>()
                                                  .removePackage(
                                                    packageList[index],
                                                  );
                                            },
                                            icon: Icon(
                                              IconsaxPlusBold.card_remove,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              )
                              : SizedBox.shrink(),
                          const SizedBox(height: 20),
                          packageList.isNotEmpty
                              ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 20,
                                    child: Checkbox(
                                      checkColor: AppColors.whiteColor,
                                      activeColor: AppColors.blueColor,
                                      value: isNegotationChecked,
                                      onChanged: (v) {
                                        setState(() {
                                          isNegotationChecked = v!;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Open for negotiation",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: addPackage,
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: ScreenUtils.screenWidth * .33,
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
                                    "Add Package",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColors.blueColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          CustomTextFormfield(
                            submittedText: (p0) {
                              if (!skills.contains(p0) && skills.length < 5) {
                                skills.add(p0);
                              }
                              _addSkills.clear();
                              setState(() {});
                            },
                            hintText: "Add Required Skills",
                            headText: "Add Skills & Expertise",
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
                                "Add Service Cover Photos",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                    border: Border.all(
                                      color: AppColors.blueColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: image,
                                ),
                              ),
                          const SizedBox(height: 20),
                          Text(
                            "Add Portfolio Projects",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          projectList.isNotEmpty
                              ? ListView.builder(
                                itemCount: projectList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder:
                                    (context, index) => Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(top: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.greyColor,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  clipBehavior: Clip.antiAlias,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: SizedBox(
                                                    width: 110,
                                                    height: 100,
                                                    child:
                                                        projectList[index]
                                                            .image,
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        projectList[index]
                                                            .projectTitle,
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .headlineSmall,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        projectList[index]
                                                            .projectDescp,
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        projectList[index]
                                                            .projectLink,
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: IconButton(
                                            onPressed: () {
                                              context
                                                  .read<AddProjectCubit>()
                                                  .removeProject(
                                                    projectList[index],
                                                  );
                                            },
                                            icon: Icon(
                                              IconsaxPlusBold.card_remove,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 20),
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: addProject,
                            child: SizedBox(
                              width: ScreenUtils.screenWidth * .33,
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
                                    "Add Project",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColors.blueColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          CustomTextFormfield(
                            isDescp: true,
                            hintText: "Add your service T&C",
                            headText: "Terms and Conditions",
                            controller: _addSkills,
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: SizedBox(
                width: ScreenUtils.screenWidth * 0.85,
                child: CustomButton(text: "Post Service", function: () {}),
              ),
            );
          },
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
            text: "On-Time",
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
            text: "Recurring",
            isSelected: professionalIndex == 1,
          ),
        ),
        // InkWell(
        //   borderRadius: BorderRadius.circular(20),
        //   onTap: () {
        //     setState(() {
        //       professionalIndex = 2;
        //     });
        //   },
        //   child: CustomCapsule(
        //     text: "On-site",
        //     isSelected: professionalIndex == 2,
        //   ),
        // ),
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
            text: "In Person",
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
            text: "Remote",
            isSelected: employmentIndex == 1,
          ),
        ),
      ],
    );
  }
}
