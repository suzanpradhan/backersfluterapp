import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/main/screens/main_screen_wrapper.dart';
import 'package:backersapp/modules/main_screens/screens/homepage.dart';
import 'package:backersapp/widgets/custom_app_bar.dart';
import 'package:backersapp/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScreenWrapper(
      route: HOMEPAGE_ROUTE,
      child: Column(
        children: [CustomAppBar(), Expanded(child: HomePage())],
      ),
    );
  }
}
