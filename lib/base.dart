import 'package:collabrats_mobile/presentation/chat/ui/chat_screen.dart';
import 'package:collabrats_mobile/presentation/discover/ui/discover_screen.dart';
import 'package:collabrats_mobile/presentation/post/ui/post_screen.dart';
import 'package:collabrats_mobile/presentation/profile/ui/profile_screen.dart';
import 'package:collabrats_mobile/presentation/requests/ui/request_screen.dart';
import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int selectedIndex = 0;

  void setItems(int indx) {
    setState(() {
      selectedIndex = indx;
    });
  }

  final List<Widget> listWidget = [
    DiscoverScreen(),
    RequestScreen(),
    PostScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: ScreenUtils.screenHeight * .1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(color: AppColors.greyColor, height: 0),
            BottomNavigationBar(
              backgroundColor: AppColors.whiteColor,
              selectedItemColor: AppColors.blueColor,
              currentIndex: selectedIndex,
              onTap: (value) => setItems(value),
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/discover_inactive.svg",
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/vectors/discover_active.svg",
                    height: 30,
                    width: 30,
                  ),
                  label: "Discover",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/request_inactive.svg",
                    height: 30,
                    width: 30,
                  ),
                  label: "Requests",
                  activeIcon: SvgPicture.asset(
                    "assets/vectors/requests_active.svg",
                    height: 30,
                    width: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/post_inactive.svg",
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/vectors/post_active.svg",
                    height: 30,
                    width: 30,
                  ),
                  label: "Post",
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/chat_inactive.svg",
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/vectors/chats_active.svg",
                    height: 30,
                    width: 30,
                  ),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/vectors/profile_inactive.svg",
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/vectors/profile_active.svg",
                    height: 30,
                    width: 30,
                  ),
                  label: "Profile",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
