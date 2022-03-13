import 'package:backersapp/constants/custom_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class NotiftileWidget extends StatelessWidget {
  final String text;
  final String label;
  const NotiftileWidget({Key? key, required this.text, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                color: CustomColors.darkBlueShade,
                borderRadius: BorderRadius.circular(99)),
            child: Icon(
              EvaIcons.checkmark,
              size: 24,
              color: CustomColors.greenAccent,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "FFMarkMedium",
                      fontSize: 14,
                      color: CustomColors.white),
                ),
                Text(
                  label,
                  style: TextStyle(
                      color: CustomColors.whiteShade,
                      fontSize: 12,
                      fontFamily: "FFMarkRegular"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
