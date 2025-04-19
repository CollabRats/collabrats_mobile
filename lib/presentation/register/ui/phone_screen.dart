import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countryCode = "+91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRegisterHeader(
        imgPath: "assets/vectors/phone.svg",
        progressValue: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What’s your phone\nnumber?",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),
            const SizedBox(height: 15),
            Form(
              key: _formKey,
              child: CustomTextFormfield(
                countryCode: (p0) {
                  setState(() {
                    countryCode = p0;
                  });
                },
                keyboardType: TextInputType.phone,
                headText: "",
                hintText: "12345678XX",
                validator: (val) => Validators.validatePhoneNumber(val ?? ""),
                controller: _phone,
                isMobile: true,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Collabrats will send you a text with verification code.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Send OTP",
        function: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(
              context,
              '/verify',
              arguments: countryCode + _phone.text,
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
