import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/navigation_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: CustomColors.darkBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: NavigationConstants.icons
            .mapIndexed((index, icon) => Icon(
                (index == currentIndex) ? icon["active"] : icon["deactive"],
                color: (index == currentIndex)
                    ? CustomColors.greenAccent
                    : CustomColors.darkBlueShade))
            .toList(),
      ),
    );
  }
}
