import 'dart:async';

import 'package:collabrats_mobile/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToMobile() {
    Navigator.pushReplacementNamed(context, '/signup');
    // Navigator.pushReplacementNamed(context, '/base');
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () => _navigateToMobile());
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return Scaffold(
      body: Center(child: Image.asset("assets/images/app_logo.png")),
    );
  }
}
