import 'dart:io';

import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/gb_models/story_model_gb.dart';
import 'package:backersapp/modules/home_screens/blocs/createStoryBloc/createstory_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewStory extends StatefulWidget {
  final File file;
  const AddNewStory({Key? key, required this.file}) : super(key: key);

  @override
  State<AddNewStory> createState() => _AddNewStoryState();
}

class _AddNewStoryState extends State<AddNewStory> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatestoryBloc(),
      child: Scaffold(
        backgroundColor: CustomColors.darkBlue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.darkBlue,
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  EvaIcons.close,
                  color: CustomColors.white,
                ))
          ],
          title: Text("Add New Story",
              style: TextStyle(
                  fontFamily: "FFMarkBold",
                  fontSize: 18,
                  color: CustomColors.white)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(widget.file), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<CreatestoryBloc, CreatestoryState>(
              listener: (context, state) {
                if (state is AddNewStorySuccessState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is AddNewStoryFailedState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<CreatestoryBloc>(context).add(
                        AddNewStoryAttemptEvent(
                            storyModelGb:
                                StoryModelGb(filePath: widget.file.path)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: CustomColors.greenAccent,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
