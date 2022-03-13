import 'package:backersapp/constants/custom_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DefaultPostBeta extends StatelessWidget {
  const DefaultPostBeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CustomColors.darkBlueFade),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              constraints: BoxConstraints(maxHeight: 380),
              width: MediaQuery.of(context).size.width,
              // height: 200,
              child: Image.asset(
                "assets/images/tests/3.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          "WLOP",
                          style: TextStyle(
                              fontFamily: "FFMarkRegular",
                              color: CustomColors.white),
                        ),
                        Text(
                          "3 hours ago",
                          style: TextStyle(
                              fontFamily: "FFMarkRegular",
                              color: CustomColors.darkBlueShade),
                        )
                      ],
                    ),
                  ],
                ),
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
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      EvaIcons.giftOutline,
                      color: CustomColors.white,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Doctor Yusica...",
              style: TextStyle(
                  fontFamily: "FFMarkRegular",
                  color: CustomColors.white,
                  fontSize: 14),
            ),
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
