import 'package:backersapp/constants/api_paths.dart';
import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/gb_models/post_model_gb.dart';
import 'package:backersapp/modules/new_post/screens/add_donation.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DefaultPost extends StatelessWidget {
  final PostModelGb postModel;
  const DefaultPost({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CustomColors.darkBlueFade),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              constraints: BoxConstraints(maxHeight: 380),
              width: MediaQuery.of(context).size.width,
              // height: 200,
              child: (postModel.fileLink != "")
                  ? Image.network(
                      ApiPaths.baseUrl + postModel.fileLink!,
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      (postModel.userModel!.avatar != null)
                          ? Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                  color: CustomColors.darkBlueShade,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(ApiPaths.baseUrl +
                                          postModel.userModel!.avatar!)),
                                  borderRadius: BorderRadius.circular(32)),
                            )
                          : Container(),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postModel.userModel!.username ?? "--",
                              style: TextStyle(
                                  fontFamily: "FFMarkRegular",
                                  color: CustomColors.white),
                            ),
                            Text(
                              postModel.createdAt ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: "FFMarkRegular",
                                  color: CustomColors.darkBlueShade),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // Icon(
                    //   EvaIcons.heartOutline,
                    //   color: CustomColors.white,
                    // ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    // Icon(
                    //   EvaIcons.messageCircleOutline,
                    //   color: CustomColors.white,
                    // ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => AddDonation(
                                      id: postModel.id!,
                                    )));
                      },
                      child: Icon(
                        EvaIcons.giftOutline,
                        color: CustomColors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              postModel.description ?? "",
              style: TextStyle(
                  fontFamily: "FFMarkRegular",
                  color: CustomColors.white,
                  fontSize: 14),
            ),
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
