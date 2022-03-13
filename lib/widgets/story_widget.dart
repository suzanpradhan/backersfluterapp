import 'package:backersapp/constants/api_paths.dart';
import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/modules/home_screens/blocs/getStorybloc/getstorys_bloc.dart';
import 'package:backersapp/modules/story/screens/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryWidget extends StatelessWidget {
  final String imageLink;
  final int index;
  final String username;
  final GetstorysBloc bloc;
  StoryWidget(
      {Key? key,
      required this.imageLink,
      required this.index,
      required this.bloc,
      required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => StoryScreen(
                  index: index,
                  bloc: bloc,
                )));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: CustomColors.greenAccent,
                  borderRadius: BorderRadius.circular(99)),
              child: Center(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: CustomColors.darkBlue, width: 2),
                      borderRadius: BorderRadius.circular(99),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ApiPaths.baseUrl + imageLink))),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              username,
              style: TextStyle(
                  fontFamily: "FFMarkRegular",
                  fontSize: 12,
                  color: CustomColors.white),
            )
          ],
        ),
      ),
    );
  }
}
