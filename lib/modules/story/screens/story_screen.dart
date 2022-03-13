import 'package:backersapp/constants/api_paths.dart';
import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/modules/home_screens/blocs/getStorybloc/getstorys_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryScreen extends StatefulWidget {
  final int index;
  final GetstorysBloc bloc;
  const StoryScreen({Key? key, required this.index, required this.bloc})
      : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
          backgroundColor: CustomColors.darkBlue,
          body: SafeArea(
            child: Stack(
              children: [
                BlocBuilder<GetstorysBloc, GetstorysState>(
                  builder: (context, state) {
                    if (state is GetStorySuccessState) {
                      return PageView(
                        physics: BouncingScrollPhysics(),
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        children: state.allstorys
                            .map(
                              (e) => Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            ApiPaths.baseUrl + e.imageLink!))),
                              ),
                            )
                            .toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                Container(
                  color: CustomColors.darkBlue.withOpacity(0.6),
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stories",
                        style: TextStyle(
                            fontFamily: "FFMarkBold",
                            fontSize: 18,
                            color: CustomColors.white),
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
                )
              ],
            ),
          )),
    );
  }
}
