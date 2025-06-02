import 'package:collabrats_mobile/utils/colors.dart';
import 'package:collabrats_mobile/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Post",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 15),
                Text(
                  "Select the type of post you want to create",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.midGreyColor,
                  ),
                ),
                const SizedBox(height: 20),
                PostTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/postJob');
                  },
                  imgPath: "assets/vectors/post.svg",
                  headText: "Post Job",
                  subText: "Hire Talent or find a job opportunity",
                  colorCode: 0xffDCFCE7,
                ),
                const SizedBox(height: 10),
                PostTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/postGig');
                  },
                  imgPath: "assets/vectors/gig.svg",
                  headText: "Post Gig",
                  subText: "Offer short term projects",
                  colorCode: 0xffCFFAFE,
                ),
                const SizedBox(height: 10),
                PostTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/postService');
                  },
                  imgPath: "assets/vectors/service.svg",
                  headText: "Post Service",
                  subText: "Hire Talent or find a job opportunity",
                  colorCode: 0xffFCE7F3,
                ),
                const SizedBox(height: 10),
                PostTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/postEvent');
                  },
                  imgPath: "assets/vectors/event.svg",
                  headText: "Post Event",
                  subText: "Share upcoming events",
                  colorCode: 0xffF3E8FF,
                ),
                const SizedBox(height: 10),
                PostTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/createCommunity');
                  },
                  imgPath: "assets/vectors/community.svg",
                  headText: "Create Community",
                  subText: "Connect with your community",
                  colorCode: 0xffFEE2E2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
