import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DonationSuccessScreen extends StatefulWidget {
  final String? message;
  const DonationSuccessScreen({Key? key, required this.message})
      : super(key: key);

  @override
  State<DonationSuccessScreen> createState() => _DonationSuccessScreenState();
}

class _DonationSuccessScreenState extends State<DonationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              EvaIcons.checkmarkCircle,
              color: CustomColors.white,
              size: 54,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "You have successfully donated.",
              style: TextStyle(
                  fontFamily: "FFMarkRegular",
                  fontSize: 16,
                  color: CustomColors.whiteShade),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, HOMEPAGE_ROUTE);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    color: CustomColors.greenAccent,
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Text(
                    "OKAY",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
