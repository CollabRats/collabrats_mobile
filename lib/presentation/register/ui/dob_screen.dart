import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DobScreen extends StatefulWidget {
  const DobScreen({super.key});

  @override
  State<DobScreen> createState() => _DobScreenState();
}

class _DobScreenState extends State<DobScreen> {
  final TextEditingController _dob = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRegisterHeader(
        imgPath: "assets/vectors/birthday.svg",
        progressValue: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How young are you ?",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: ScreenUtils.screenWidth * 0.9,
                child: Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    controller: _dob,
                    validator: (val) {
                      return Validators.validateDob(val ?? '');
                    },
                    length: 8,
                    obscureText: false,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    enabled: true,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 30,
                      selectedColor: AppColors.blackColor,
                      activeFillColor: AppColors.whiteColor,
                      inactiveColor: AppColors.blackColor,
                      activeColor: AppColors.greyColor,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: AppColors.whiteColor,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,

                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(IconsaxPlusLinear.eye),
                const SizedBox(width: 5),
                Text(
                  "Always visible on profile",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Continue",
        function: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/location');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
