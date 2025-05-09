import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';

import 'package:multi_masked_formatter/multi_masked_formatter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:intl/intl.dart';

class CustomTextFormfield extends StatefulWidget {
  final bool isActive;
  final bool isShort;
  final bool isTime;
  final bool showLoader;
  final String headText;
  final bool isDescp;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isMobile;
  final bool isDate;
  final bool isHaveSwitch;
  final String switchText;
  final void Function(bool)? onChangedSwitch;
  final bool switchValue;
  final bool obscureText;
  final bool showPass;
  final void Function()? onTap;
  final String? hintText;
  final String? initialValue;
  final void Function(String)? countryCode;
  final void Function(String)? submittedText;
  const CustomTextFormfield({
    super.key,
    required this.headText,
    required this.controller,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.isMobile = false,
    this.isHaveSwitch = false,
    this.switchText = "",
    this.onChangedSwitch,
    this.switchValue = false,
    this.isDate = false,
    this.obscureText = false,
    this.showPass = false,
    this.onTap,
    this.hintText = '',
    this.showLoader = false,
    this.onChanged,
    this.initialValue,
    this.isActive = true,
    this.countryCode,
    this.submittedText,
    this.isDescp = false,
    this.isShort = false,
    this.isTime = false,
  });

  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

class _CustomTextFormfieldState extends State<CustomTextFormfield> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.headText,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isMobile
                ? IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.lightGreyColor,
                        ),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 0.85,
                              child: CountryCodePicker(
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                                insetPadding: EdgeInsets.all(20),
                                mode: CountryCodePickerMode.dialog,
                                onChanged: (country) {
                                  widget.countryCode!(country.dialCode);
                                },
                                initialSelection: 'IN',
                                showFlag: true,
                                showDropDownButton: true,
                              ),
                            ),
                            // DropdownButton(items: [], onChanged: (v) {}),
                            // SizedBox(width: 10),
                            VerticalDivider(
                              color: AppColors.greyColor,
                              width: 1,
                            ),
                            SizedBox(width: 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                : const SizedBox.shrink(),
            Skeletonizer(
              containersColor: AppColors.lightGreyColor,
              ignorePointers: true,
              enabled: widget.showLoader,
              child: Container(
                height: widget.isDescp ? 140 : 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                width:
                    widget.isDate || widget.isShort || widget.isTime
                        ? ScreenUtils.screenWidth * .35
                        : (widget.isMobile
                            ? size.width * 0.53
                            : size.width * 0.89),
                alignment:
                    widget.isDescp ? Alignment.topLeft : Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.lightGreyColor,
                ),
                child:
                    widget.isDate
                        ? TextFormField(
                          enabled: widget.isActive,
                          controller: widget.controller,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.midGreyColor),
                            hintText:
                                widget.hintText == '' ? null : widget.hintText,
                            suffixIconConstraints: BoxConstraints(
                              maxHeight: 22,
                              maxWidth: 16,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                final DateFormat formatter = DateFormat(
                                  'MM/yyyy',
                                );

                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  helpText: 'Select Month and Year',
                                  initialEntryMode:
                                      DatePickerEntryMode.calendar,
                                );
                                if (picked != null) {
                                  widget.controller.text = formatter.format(
                                    picked,
                                  );
                                  setState(() {});
                                }
                              },
                              child: Icon(
                                color: AppColors.blueColor,
                                Icons.calendar_month,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: Theme.of(context).textTheme.bodyMedium,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            MultiMaskedTextInputFormatter(
                              masks: ['xx/xxxx'],
                              separator: '/',
                            ),
                          ],
                          validator: widget.validator,
                        )
                        : widget.isTime
                        ? TextFormField(
                          enabled: widget.isActive,
                          controller: widget.controller,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.midGreyColor),
                            hintText:
                                widget.hintText == '' ? null : widget.hintText,
                            suffixIconConstraints: BoxConstraints(
                              maxHeight: 22,
                              maxWidth: 16,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                String formatTimeOfDay(
                                  TimeOfDay tod,
                                  BuildContext context,
                                ) {
                                  return tod.format(
                                    context,
                                  ); // Uses system locale (e.g., 5:30 PM)
                                }

                                final TimeOfDay? picked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (picked != null) {
                                  widget.controller.text = formatTimeOfDay(
                                    picked,
                                    context,
                                  );
                                  setState(() {});
                                }
                              },
                              child: Icon(
                                color: AppColors.blueColor,
                                Icons.alarm,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: Theme.of(context).textTheme.bodyMedium,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            MultiMaskedTextInputFormatter(
                              masks: ['xx/xxxx'],
                              separator: '/',
                            ),
                          ],
                          validator: widget.validator,
                        )
                        : TextFormField(
                          maxLines: widget.isDescp ? 30 : 1,
                          onFieldSubmitted: (value) {
                            setState(() {
                              widget.submittedText!(value);
                            });
                          },
                          initialValue: widget.initialValue,
                          onChanged: widget.onChanged,
                          focusNode: widget.focusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: widget.controller,
                          validator: widget.validator,
                          keyboardType: widget.keyboardType,
                          obscureText: widget.showPass,
                          style: Theme.of(context).textTheme.bodyMedium!,
                          cursorColor: AppColors.blackColor,
                          enabled: widget.isActive ? true : false,
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.midGreyColor),
                            hintText:
                                widget.hintText == '' ? null : widget.hintText,
                            contentPadding:
                                widget.obscureText
                                    ? EdgeInsets.only(top: 12)
                                    : null,
                            suffixIcon:
                                widget.obscureText
                                    ? GestureDetector(
                                      onTap: widget.onTap,
                                      child: Icon(
                                        widget.showPass
                                            ? Icons.visibility_off_outlined
                                            : Icons.remove_red_eye_outlined,
                                      ),
                                    )
                                    : null,
                            border: InputBorder.none,
                          ),
                        ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
