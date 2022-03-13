import 'package:backersapp/widgets/posts_cards/default_post_beta.dart';
import 'package:flutter/material.dart';

class SavedPosts extends StatelessWidget {
  const SavedPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultPostBeta(),
        ),
        SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultPostBeta(),
        ),
        SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultPostBeta(),
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
