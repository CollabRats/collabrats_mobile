import 'package:collabrats_mobile/utils/validators.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:collabrats_mobile/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRegisterHeader(
        imgPath: "assets/vectors/name.svg",
        progressValue: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What’s your name?",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormfield(
                    keyboardType: TextInputType.name,
                    headText: "",
                    hintText: "First Name (Required)",
                    validator: (val) => Validators.validateName(val ?? ""),
                    controller: _firstName,
                  ),
                  CustomTextFormfield(
                    keyboardType: TextInputType.name,
                    headText: "",
                    hintText: "Last Name",
                    controller: _lastName,
                  ),
                ],
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
            Navigator.pushNamed(context, '/dob');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
