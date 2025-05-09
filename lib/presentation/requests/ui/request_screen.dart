import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "See who wants to collab",
                style: Theme.of(context).textTheme.headlineLarge!,
              ),
              const SizedBox(height: 10),
              Text(
                "They’re into you! If you’re into them too, like them back to match instantly",
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
              SizedBox(height: ScreenUtils.screenHeight * .2),
              Center(child: Image.asset("assets/images/find_people.png")),
              Text(
                textAlign: TextAlign.center,
                "You have no request pending, Swipe more to collab",
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
              const SizedBox(height: 20),
              CustomButton(text: "Collab More", function: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
