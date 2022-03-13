import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/auth/screens/login_screen.dart';
import 'package:backersapp/modules/auth/screens/register_screen.dart';
import 'package:backersapp/modules/auth/screens/splash_screen.dart';
import 'package:backersapp/modules/home_screens/blocs/getPostsBloc/getposts_bloc.dart';
import 'package:backersapp/modules/main_screens/screens/main_screen.dart';
import 'package:backersapp/modules/new_post/screens/add_new_post.dart';
import 'package:backersapp/modules/new_post/screens/add_new_story.dart';
import 'package:backersapp/modules/notifications/screens/notification_screen.dart';
import 'package:backersapp/modules/profile/screens/profile_screen.dart';
import 'package:backersapp/modules/screens/search_screen.dart';
import 'package:backersapp/modules/settings/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AppStarter());
}

class AppStarter extends StatelessWidget {
  const AppStarter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: <BlocProvider>[
          BlocProvider(create: (context) => GetpostsBloc())
        ],
        child: MaterialApp(
          builder: (context, widget) => MultiBlocProvider(
              providers: <BlocProvider>[
                BlocProvider(create: (context) => GetpostsBloc())
              ],
              child: widget!),
          title: 'Backers',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: SPLASH_ROUTE,
          routes: <String, WidgetBuilder>{
            SPLASH_ROUTE: (context) => SplashScreen(),
            HOMEPAGE_ROUTE: (context) => MainScreen(),
            LOGIN_ROUTE: (context) => LoginScreen(),
            REGISTER_ROUTE: (context) => RegisterScreen(),
            SETTINGS_ROUTE: (context) => SettingsScreen(),
            NOTIFICATION_ROUTE: (context) => NotificationScreen(),
            SEARCH_ROUTE: (context) => SearchScreen(),
            ADD_NEW_POST_ROUTE: (context) => AddNewPost(),
            PROFILE_ROUTE: (context) => ProfileScreen()
          },
        ));
  }
}
