import 'package:backersapp/modules/auth/models/user_model.dart';

class PostModelGb {
  final int? id;
  final String? description;
  final int? totalLikes;
  final String? fileLink;
  final String? postType;
  final String? createdAt;
  final String? updatedAt;
  final bool? isPublic;
  final String? embedLink;
  final UserModel? userModel;
  final String? filePath;

  PostModelGb(
      {this.createdAt,
      this.description,
      this.fileLink,
      this.embedLink,
      this.id,
      this.postType,
      this.userModel,
      this.totalLikes,
      this.updatedAt,
      this.isPublic,
      this.filePath});

  factory PostModelGb.fromJsonForGetAllPosts(
      {required Map<String, dynamic> map}) {
    return PostModelGb(
        id: map["id"],
        description: map["description"],
        fileLink: map["file"],
        createdAt: map["created_at"],
        updatedAt: map["updated_at"],
        postType: map["image"],
        totalLikes: map["totalLikes"],
        userModel: UserModel.fromJsonForPostProfile(map: map["user"]),
        isPublic: map["isPublic"]);
  }
}
