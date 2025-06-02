import 'package:collabrats_mobile/presentation/discover/ui/community_screen.dart';
import 'package:collabrats_mobile/presentation/discover/ui/event_screen.dart';
import 'package:collabrats_mobile/presentation/discover/ui/gig_screen.dart';
import 'package:collabrats_mobile/presentation/discover/ui/job_screen.dart';
import 'package:collabrats_mobile/presentation/discover/ui/people_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<Widget> discoverWidget = [
    PeopleScreen(),
    GigScreen(),
    JobScreen(),
    EventScreen(),
    CommunityScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("CollabRats"),
        bottomOpacity: 0,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset("assets/vectors/page_info.svg"),
          ),
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
      body: discoverWidget[4],
    );
  }
}
