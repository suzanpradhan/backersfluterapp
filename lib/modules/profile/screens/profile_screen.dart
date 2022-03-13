import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/home_screens/blocs/getMyWalletBloc/getwallet_bloc.dart';
import 'package:backersapp/modules/main/screens/main_screen_wrapper.dart';
import 'package:backersapp/modules/profile/screens/my_posts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = PROFILE_ROUTE;
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isMyposts = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetwalletBloc()..add(GetMyWalletAttempt()),
      child: Scaffold(
        backgroundColor: CustomColors.darkBlue,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: CustomColors.darkBlue,
          elevation: 1,
          title: Text("Profile",
              style: TextStyle(
                  fontFamily: "FFMarkBold",
                  fontSize: 18,
                  color: CustomColors.white)),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColors.darkBlueShade,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocConsumer<GetwalletBloc, GetwalletState>(
                          listener: (context, state) {
                            if (state is GetMyWalletSuccessState) {
                              setState(() {});
                            }
                          },
                          builder: (context, state) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/tests/2.jfif"))),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("suzanpradhan",
                                        style: TextStyle(
                                            fontFamily: "FFMarkBold",
                                            fontSize: 18,
                                            color: CustomColors.white)),
                                    Text(
                                        (state is GetMyWalletSuccessState)
                                            ? "\$ " + state.amount.toString()
                                            : "--",
                                        style: TextStyle(
                                            fontFamily: "FFMarkRegular",
                                            fontSize: 14,
                                            color: CustomColors.whiteShade)),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.pushNamed(context, PAYMENT_ROUTE);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: CustomColors.greenAccent,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Withdraw",
                                              style: TextStyle(
                                                  fontFamily: "PoppinsRegular",
                                                  color: CustomColors.darkBlue,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              EvaIcons.download,
                                              size: 18,
                                              color: CustomColors.darkBlue,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SETTINGS_ROUTE);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CustomColors.darkBlue),
                            child: Icon(
                              EvaIcons.settings,
                              size: 20,
                              color: CustomColors.greenAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: CustomColors.darkBlueShade,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isMyposts = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: (isMyposts)
                                    ? CustomColors.greenAccent
                                    : CustomColors.darkBlueShade,
                                borderRadius: BorderRadius.circular(6)),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: Text(
                                "MY POSTS",
                                style: (!isMyposts)
                                    ? TextStyle(
                                        color: CustomColors.whiteShade,
                                        fontFamily: "FFMarkBold",
                                        fontSize: 14)
                                    : TextStyle(
                                        color: CustomColors.darkBlue,
                                        fontFamily: "FFMarkBold",
                                        fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isMyposts = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: (!isMyposts)
                                    ? CustomColors.greenAccent
                                    : CustomColors.darkBlueShade,
                                borderRadius: BorderRadius.circular(6)),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: Text(
                                "SAVED",
                                style: (!isMyposts)
                                    ? TextStyle(
                                        color: CustomColors.darkBlue,
                                        fontFamily: "FFMarkBold",
                                        fontSize: 14)
                                    : TextStyle(
                                        color: CustomColors.whiteShade,
                                        fontFamily: "FFMarkBold",
                                        fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              MyPosts()
            ],
          ),
        ),
      ),
    );
  }
}
