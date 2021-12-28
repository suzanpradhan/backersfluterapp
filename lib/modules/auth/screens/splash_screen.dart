import 'dart:async';

import 'package:backersapp/constants/assets_path.dart';
import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/modules/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  testSplashtimer({required BuildContext context}) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    testSplashtimer(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.logoBlueShade,
              height: 24,
            ),
            const SizedBox(
              height: 14,
            ),
            const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                color: CustomColors.darkBlueShade,
                strokeWidth: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
