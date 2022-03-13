import 'dart:io';

import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/home_screens/blocs/createStoryBloc/createstory_bloc.dart';
import 'package:backersapp/modules/home_screens/blocs/getMyWalletBloc/getwallet_bloc.dart';
import 'package:backersapp/modules/home_screens/blocs/getPostsBloc/getposts_bloc.dart';
import 'package:backersapp/modules/home_screens/blocs/getStorybloc/getstorys_bloc.dart';
import 'package:backersapp/modules/new_post/screens/add_new_story.dart';
import 'package:backersapp/widgets/posts_cards/default_post_beta.dart';
import 'package:backersapp/widgets/posts_cards/default_post.dart';
import 'package:backersapp/widgets/posts_cards/goal_posts.dart';
import 'package:backersapp/widgets/story_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? selectedImage;
  pickImageHandler() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  AddNewStory(file: File(image.path))));
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  GetpostsBloc getpostsBloc = GetpostsBloc();
  GetstorysBloc getstorysBloc = GetstorysBloc();

  void _onRefresh() async {
    getpostsBloc.add(GetAllPostsEvent());
    getstorysBloc.add(GetAllStoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getpostsBloc..add(GetAllPostsEvent()),
        ),
        BlocProvider(
          create: (context) => getstorysBloc..add(GetAllStoryEvent()),
        ),
        BlocProvider(
          create: (context) => CreatestoryBloc(),
        ),
      ],
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              BlocConsumer<GetstorysBloc, GetstorysState>(
                listener: (context, state) {
                  if (state is GetStorySuccessState) {
                    _refreshController.refreshCompleted();
                  }
                },
                builder: (context, state) {
                  if (state is GetStorySuccessState) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            pickImageHandler();
                          },
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: CustomColors.darkBlueShade),
                            child: Icon(
                              EvaIcons.plus,
                              size: 28,
                              color: CustomColors.darkBlue,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 82,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: state.allstorys.length,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  if (state.allstorys
                                      .take(index)
                                      .where((element) =>
                                          (element.userModel!.username ==
                                              state.allstorys[index].userModel!
                                                  .username))
                                      .isEmpty) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: StoryWidget(
                                        bloc: BlocProvider.of<GetstorysBloc>(
                                            context),
                                        imageLink:
                                            state.allstorys[index].imageLink!,
                                        index: index,
                                        username: state.allstorys[index]
                                            .userModel!.username!,
                                      ),
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                }),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 18,
              ),
              //Posts

              BlocBuilder<GetpostsBloc, GetpostsState>(
                builder: (context, state) {
                  if (state is GotAllPostsState) {
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.allposts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: DefaultPost(
                                postModel: state.allposts[index],
                              ));
                        });
                  } else if (state is GettingAllPostState) {
                    return CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    );
                  } else if (state is GetAllPostsFailedState) {
                    return Text(
                      "Feed Load Failed.",
                      style: TextStyle(
                          fontFamily: "FFMarkRegular",
                          color: CustomColors.white),
                    );
                  } else {
                    return Text(
                      "No posts to show.",
                      style: TextStyle(
                          fontFamily: "FFMarkRegular",
                          color: CustomColors.white),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
