import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String route = SEARCH_ROUTE;
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBlue,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: CustomColors.darkBlueShade,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                EvaIcons.search,
                                color: CustomColors.white,
                                size: 24,
                              ),
                            ),
                            Expanded(
                                child: TextField(
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                          fontFamily: "FFMarkRegular",
                                          color: CustomColors.white),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      EvaIcons.close,
                      color: CustomColors.white,
                    ))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: CustomColors.darkBlueShade,
            )
          ],
        ),
      ),
    );
  }
}
