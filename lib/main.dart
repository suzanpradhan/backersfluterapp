import 'package:backersapp/modules/auth/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppStarter());
}

class AppStarter extends StatelessWidget {
  const AppStarter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
