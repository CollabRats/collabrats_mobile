import 'dart:async';

import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _otp = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;
  final int timeOut = 30;
  int _start = 0;

  void startTimer() {
    _timer?.cancel();

    setState(() {
      _start = timeOut;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (!mounted) return;

      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phone = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: CustomRegisterHeader(
        imgPath: "assets/vectors/verify.svg",
        progressValue: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter verification\ncode",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),

            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Code is sent to $phone",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Edit",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.blueColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: ScreenUtils.screenWidth * 0.8,
                child: Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    controller: _otp,
                    validator: (val) {
                      return Validators.validateOtp(val ?? '');
                    },
                    length: 5,
                    obscureText: false,
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    enablePinAutofill: true,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 50,
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  if (_start != 0) {
                    return;
                  }
                  startTimer();
                },
                child: Text(
                  _start == 0 ? "Resend OTP" : "Resend OTP in $_start seconds",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.blueColor),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Verify OTP",
        function: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/name');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
