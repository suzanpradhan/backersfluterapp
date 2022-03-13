import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/modules/home_screens/blocs/getMyPostsBloc/getmyposts_bloc.dart';
import 'package:backersapp/widgets/posts_cards/default_post.dart';
import 'package:backersapp/widgets/posts_cards/default_post_beta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetmypostsBloc()..add(GetMyPostsEvent()),
      child: BlocBuilder<GetmypostsBloc, GetmypostsState>(
          builder: (context, state) {
        if (state is GotMyPostsState) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.myposts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: DefaultPost(
                      postModel: state.myposts[index],
                    ));
              });
        } else if (state is GettingMyPostState) {
          return CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1,
          );
        } else if (state is GetMyPostsFailedState) {
          return Text(
            "Posts Load Failed.",
            style: TextStyle(
                fontFamily: "FFMarkRegular", color: CustomColors.white),
          );
        } else {
          return Text(
            "No posts to show.",
            style: TextStyle(
                fontFamily: "FFMarkRegular", color: CustomColors.white),
          );
        }
      }),
    );
  }
}
