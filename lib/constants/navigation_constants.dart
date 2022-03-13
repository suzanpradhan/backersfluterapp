import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

class NavigationConstants {
  static final List<Widget> screens = <Widget>[
    Container(),
    Container(),
    Container(),
    Container()
  ];

  static final List icons = [
    {"active": EvaIcons.home, "deactive": EvaIcons.homeOutline},
    {"active": EvaIcons.heart, "deactive": EvaIcons.heartOutline},
    {"active": EvaIcons.search, "deactive": EvaIcons.searchOutline},
    {"active": EvaIcons.settings2, "deactive": EvaIcons.settings2Outline}
  ];
}
