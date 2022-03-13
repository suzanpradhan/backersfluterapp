import 'dart:async';

import 'package:backersapp/constants/assets_path.dart';
import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/auth/blocs/authChecker/authcheck_bloc.dart';
import 'package:backersapp/modules/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthcheckBloc()..add(AuthCheckaAttempt()),
      child: BlocListener<AuthcheckBloc, AuthcheckState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushNamed(context, HOMEPAGE_ROUTE);
          } else {
            Navigator.pushNamed(context, LOGIN_ROUTE);
          }
        },
        child: Scaffold(
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
        ),
      ),
    );
  }
}
