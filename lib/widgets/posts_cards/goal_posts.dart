import 'dart:ui';

import 'package:backersapp/constants/custom_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class GoalPost extends StatefulWidget {
  const GoalPost({Key? key}) : super(key: key);

  @override
  State<GoalPost> createState() => _GoalPostState();
}

class _GoalPostState extends State<GoalPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColors.darkBlueFade),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                          color: CustomColors.darkBlueShade,
                          image: DecorationImage(
                              image: AssetImage("assets/images/tests/1.webp")),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shembiks",
                          style: TextStyle(
                              fontFamily: "FFMarkMedium",
                              color: CustomColors.white),
                        ),
                        Text(
                          "2 days ago",
                          style: TextStyle(
                              fontFamily: "FFMarkRegular",
                              color: CustomColors.darkBlueShade),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  "GOAL",
                  style: TextStyle(
                      fontFamily: "FFMarkBlack",
                      fontSize: 18,
                      color: CustomColors.darkBlueShade),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: CustomColors.darkBlueShade,
          ),

          // Goal Progress
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$2600.00 of \$3000.00",
                  style: TextStyle(
                      fontFamily: "FFMarkMedium",
                      color: CustomColors.greenAccent),
                ),
                SizedBox(
                  height: 5,
                ),
                LinearProgressIndicator(
                  backgroundColor: CustomColors.darkBlue,
                  color: CustomColors.greenAccent,
                  value: 0.7,
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                constraints: BoxConstraints(maxHeight: 300),
                width: MediaQuery.of(context).size.width,
                // height: 200,
                child: Image.asset(
                  "assets/images/tests/4.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cold Harvest: Аlternative visual novel",
                  style: TextStyle(
                      fontFamily: "FFMarkMedium",
                      color: CustomColors.white,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '"The Cold Harvest" is a combination of a visual novel with adventures, a dating simulator and a world which you can freely explore.',
                  style: TextStyle(
                      fontFamily: "FFMarkRegular",
                      color: CustomColors.whiteShade,
                      fontSize: 13),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      EvaIcons.heartOutline,
                      color: CustomColors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      EvaIcons.messageCircleOutline,
                      color: CustomColors.white,
                    )
                  ],
                ),
                Material(
                  borderRadius: BorderRadius.circular(5),
                  color: CustomColors.darkBlueShade,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5),
                    highlightColor: Colors.transparent,
                    splashColor: CustomColors.greenAccent,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Text(
                        "Back this goal",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "FFMarkRegular",
                            color: CustomColors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
