// ignore_for_file: use_build_context_synchronously
import 'package:collabrats_mobile/utils/presenters.dart';
import 'package:collabrats_mobile/widgets/custom_button.dart';
import 'package:collabrats_mobile/widgets/custom_capsule.dart';
import 'package:collabrats_mobile/widgets/custom_register_header.dart';
import 'package:flutter/material.dart';

class LookingForScreen extends StatefulWidget {
  const LookingForScreen({super.key});

  @override
  State<LookingForScreen> createState() => _LookingForScreenState();
}

class _LookingForScreenState extends State<LookingForScreen> {
  List<String> opportunities = [
    'Friends',
    'Investment/Investor',
    'Freelancing',
    'Mentee/Mentor',
    'Freelancing',
    'Internship',
    'Full-time Job',
    'Networking',
    'Events',
    'Freelancing',
    'Co-Founder',
    'Part-time job',
    'Consulting Projects',
    'People to hire',
    'Community',
    'Research',
    'Joint Ventures/Partnership',
    'Speakers/Panel Opportunity',
    'Peer Group/Study Circle',
    'Content/Media Collaborations',
    'Beta Testing/ Feedback Partnership',
    'Volunteer/NGO Partnership',
    'Creative Collaborations',
  ];

  List<String> selectedOpportunities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomRegisterHeader(
          imgPath: "assets/vectors/search.svg",
          progressValue: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What are you\nlooking for ?",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
              ),
              const SizedBox(height: 15),
              Text(
                "select up to 5 options",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              const SizedBox(height: 10),
              _opportunityWidget(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),

      floatingActionButton: CustomButton(
        text: "Continue",
        function: () {
          if (selectedOpportunities.length <= 5) {
            Navigator.pushNamed(context, '/hobby');
          } else {
            Presenters.showSnackBar(context, "Please select upto 5");
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _opportunityWidget() {
    return Wrap(
      spacing: 7,
      runSpacing: 6,
      direction: Axis.horizontal,
      children:
          opportunities
              .map(
                (val) => InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    if (selectedOpportunities.contains(val)) {
                      selectedOpportunities.remove(val);
                    } else {
                      selectedOpportunities.add(val);
                    }
                    setState(() {});
                  },
                  child: CustomCapsule(
                    text: val,
                    isSelected: selectedOpportunities.contains(val),
                  ),
                ),
              )
              .toList(),
    );
  }
}
