import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MainScreenWrapper extends StatelessWidget {
  final Widget child;
  final String route;
  final PreferredSizeWidget? appBar;
  const MainScreenWrapper(
      {Key? key, required this.child, this.appBar, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      appBar: appBar,
      body: child,
      bottomNavigationBar: Container(
        height: 50,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: CustomColors.darkBlueShade,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if (route != HOMEPAGE_ROUTE) {
                          Navigator.pushReplacementNamed(
                              context, HOMEPAGE_ROUTE);
                        }
                      },
                      icon: Icon(EvaIcons.home,
                          color: (route == HOMEPAGE_ROUTE)
                              ? CustomColors.greenAccent
                              : CustomColors.darkBlueShade)),
                  IconButton(
                      onPressed: () {
                        if (route != SEARCH_ROUTE) {
                          Navigator.pushNamed(context, SEARCH_ROUTE);
                        }
                      },
                      icon: Icon(EvaIcons.search,
                          color: CustomColors.darkBlueShade)),
                  IconButton(
                      onPressed: () {
                        if (route != ADD_NEW_POST_ROUTE) {
                          Navigator.pushNamed(context, ADD_NEW_POST_ROUTE);
                        }
                      },
                      icon: Icon(EvaIcons.plus,
                          color: CustomColors.darkBlueShade)),
                  IconButton(
                      onPressed: () {
                        if (route != NOTIFICATION_ROUTE) {
                          Navigator.pushReplacementNamed(
                              context, NOTIFICATION_ROUTE);
                        }
                      },
                      icon: Icon(EvaIcons.bell,
                          color: (route == NOTIFICATION_ROUTE)
                              ? CustomColors.greenAccent
                              : CustomColors.darkBlueShade)),
                  IconButton(
                      onPressed: () {
                        if (route != SETTINGS_ROUTE) {
                          Navigator.pushReplacementNamed(
                              context, SETTINGS_ROUTE);
                        }
                      },
                      icon: Icon(EvaIcons.settings,
                          color: (route == SETTINGS_ROUTE)
                              ? CustomColors.greenAccent
                              : CustomColors.darkBlueShade)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
