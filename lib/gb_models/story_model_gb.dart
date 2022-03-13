import 'package:backersapp/modules/auth/models/user_model.dart';

class StoryModelGb {
  final int? id;
  final String? imageLink;
  final String? createdAt;
  final String? endAt;
  final UserModel? userModel;
  final String? filePath;

  StoryModelGb(
      {this.createdAt,
      this.imageLink,
      this.id,
      this.endAt,
      this.userModel,
      this.filePath});

  factory StoryModelGb.fromJsonForGetAllStory(
      {required Map<String, dynamic> map}) {
    return StoryModelGb(
      id: map["id"],
      imageLink: map["image"] ?? "",
      userModel: UserModel.fromJsonForPostProfile(map: map["user"]),
    );
  }
}
