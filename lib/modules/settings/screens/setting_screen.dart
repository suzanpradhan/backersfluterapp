import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/auth/repos/auth_repo.dart';
import 'package:backersapp/modules/main/screens/main_screen_wrapper.dart';
import 'package:backersapp/modules/settings/widgets/setting_tile_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreenWrapper(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.darkBlue,
        elevation: 1,
        title: Text("Settings",
            style: TextStyle(
                fontFamily: "FFMarkBold",
                fontSize: 18,
                color: CustomColors.white)),
      ),
      route: SETTINGS_ROUTE,
      child: Column(
        children: [
          SettingTileScreen(
              icon: EvaIcons.bell, text: "Notifications", onTap: () {}),
          SettingTileScreen(
              icon: EvaIcons.edit, text: "Edit Profile", onTap: () {}),
          SettingTileScreen(
              icon: EvaIcons.lock, text: "Change Password", onTap: () {}),
          SettingTileScreen(icon: EvaIcons.star, text: "Rate Us", onTap: () {}),
          SettingTileScreen(
              icon: EvaIcons.file, text: "Terms and Conditions", onTap: () {}),
          SettingTileScreen(
              icon: EvaIcons.questionMarkCircle,
              text: "About Us",
              onTap: () {}),
          SettingTileScreen(
              icon: EvaIcons.logOut,
              isLogOut: true,
              text: "Log Out",
              onTap: () {
                AuthRepo().logout(context);
              }),
        ],
      ),
    );
  }
}
