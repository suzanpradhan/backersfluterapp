import 'dart:io';

import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/gb_models/post_model_gb.dart';
import 'package:backersapp/modules/auth/blocs/authChecker/authcheck_bloc.dart';
import 'package:backersapp/modules/home_screens/repos/post_repo.dart';
import 'package:backersapp/modules/new_post/blocs/addnewpost/addnewpost_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({Key? key}) : super(key: key);

  @override
  State<AddNewPost> createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  File? selectedImage;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  pickImageHandler() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnewpostBloc(),
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
          title: Text("Add New Post",
              style: TextStyle(
                  fontFamily: "FFMarkBold",
                  fontSize: 18,
                  color: CustomColors.white)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Text("Cover Image",
                      style: TextStyle(
                          fontFamily: "FFMarkBold",
                          fontSize: 16,
                          color: CustomColors.white)),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      pickImageHandler();
                    },
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: (selectedImage != null)
                              ? DecorationImage(
                                  image: FileImage(selectedImage!),
                                  fit: BoxFit.cover)
                              : null,
                          color: CustomColors.darkBlueShade,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Select Image",
                          style: TextStyle(
                              fontFamily: "FFMarkRegular",
                              fontSize: 14,
                              color: CustomColors.whiteShade),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 14,
                  // ),
                  // Text(
                  //   "Title",
                  //   style: TextStyle(
                  //       fontFamily: "FFMarkBold",
                  //       fontSize: 16,
                  //       color: CustomColors.white),
                  // ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  // TextField(
                  //   controller: titleController,
                  //   style: TextStyle(
                  //       fontFamily: "FFMarkRegular",
                  //       fontSize: 14,
                  //       color: CustomColors.white),
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide.none,
                  //           borderRadius: BorderRadius.circular(8)),
                  //       fillColor: CustomColors.darkBlueShade,
                  //       filled: true,
                  //       hintText: "eg. Lorem ipsum dolor sit amet",
                  //       hintStyle: TextStyle(
                  //           fontFamily: "FFMarkRegular",
                  //           fontSize: 14,
                  //           color: CustomColors.whiteShade),
                  //       isDense: true,
                  //       contentPadding:
                  //           EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                  // ),
                  SizedBox(
                    height: 14,
                  ),
                  Text("Content",
                      style: TextStyle(
                          fontFamily: "FFMarkBold",
                          fontSize: 16,
                          color: CustomColors.white)),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: contentController,
                    style: TextStyle(
                        fontFamily: "FFMarkRegular",
                        fontSize: 14,
                        color: CustomColors.white),
                    minLines: 14,
                    maxLines: 99,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8)),
                        fillColor: CustomColors.darkBlueShade,
                        filled: true,
                        hintText: "Enter your content here...",
                        hintStyle: TextStyle(
                            fontFamily: "FFMarkRegular",
                            fontSize: 14,
                            color: CustomColors.whiteShade),
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  BlocConsumer<AddnewpostBloc, AddnewpostState>(
                    listener: (context, state) {
                      if (state is AddNewPostSuccessState) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                      } else if (state is AddNewPostFailedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (selectedImage != null) {
                            BlocProvider.of<AddnewpostBloc>(context).add(
                                AddNewPostAttemptEvent(
                                    postModelGb: PostModelGb(
                                        description: contentController.text,
                                        filePath: selectedImage!.path)));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Post image is required.")));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              color: CustomColors.greenAccent,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text(
                              "POST NOW",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
