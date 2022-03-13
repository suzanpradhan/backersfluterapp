import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/home_screens/blocs/getMyWalletBloc/getwallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetwalletBloc()..add(GetMyWalletAttempt()),
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
              color: CustomColors.darkBlue,
              border: Border(
                  bottom:
                      BorderSide(width: 1, color: CustomColors.darkBlueFade))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discover",
                style: TextStyle(
                    fontFamily: "FFMarkBlack",
                    fontSize: 20,
                    color: CustomColors.white),
              ),
              BlocListener<GetwalletBloc, GetwalletState>(
                listener: (context, state) {
                  if (state is GetMyWalletSuccessState) {
                    setState(() {});
                  }
                },
                child: BlocBuilder<GetwalletBloc, GetwalletState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            BlocProvider.of<GetwalletBloc>(context)
                                .add(GetMyWalletAttempt());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 34,
                            child: Center(
                                child: Text(
                              (state is GetMyWalletSuccessState)
                                  ? "\$ " + state.amount.toString()
                                  : "--",
                              style: TextStyle(
                                  fontFamily: "FFMarkRegular",
                                  fontSize: 14,
                                  color: CustomColors.white),
                            )),
                            decoration: BoxDecoration(
                                color: CustomColors.darkBlueFade,
                                border: Border.all(
                                    color: CustomColors.darkBlueShade,
                                    width: 1),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, PROFILE_ROUTE);
                          },
                          child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/tests/2.jfif")))),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
