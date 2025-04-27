import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/logo_big.png")),
          const SizedBox(height: 10),
          Text("CollabRats", style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 10),
          SizedBox(
            width: ScreenUtils.screenWidth * 0.85,
            child: Center(
              child: Text(
                "New opportunities just swipe away",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: ScreenUtils.screenWidth * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.midGreyColor.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/vectors/google.svg"),
                  const SizedBox(width: 5),
                  Text(
                    "Google",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: ScreenUtils.screenWidth * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.midGreyColor.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/vectors/facebook.svg"),
                  const SizedBox(width: 5),
                  Text(
                    "Facebook",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text("OR", style: Theme.of(context).textTheme.headlineMedium!),
          const SizedBox(height: 15),
          SizedBox(
            width: ScreenUtils.screenWidth * .9,
            child: CustomButton(text: "Login", function: () {}),
          ),
          const SizedBox(height: 45),
          SizedBox(
            width: ScreenUtils.screenWidth * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.pushNamed(context, '/phone');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColors.lightBlueColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
