import 'package:backersapp/constants/api_paths.dart';
import 'package:backersapp/gb_models/story_model_gb.dart';
import 'package:backersapp/modules/auth/services/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoryRepo {
  Future<List<StoryModelGb>> getAllStory() async {
    try {
      var url = Uri.parse(ApiPaths.getAllStoryUrl);
      var res = await http
          .get(
            url,
          )
          .timeout(const Duration(seconds: 10));
      print(res.body);
      if (res.statusCode == 200) {
        List<StoryModelGb> data = (jsonDecode(res.body)["results"] as List)
            .map((storyDate) =>
                StoryModelGb.fromJsonForGetAllStory(map: storyDate))
            .toList();
        return data;
      } else {
        print(res.body);
        return Future.error("Story Load Failed!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Story Load Failed!');
    }
  }

  Future<bool> createNewPost({required StoryModelGb storyModelGb}) async {
    try {
      var dio = Dio();

      SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getLocalToken();

      if (token != null) {
        var formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(storyModelGb.filePath!,
              filename: storyModelGb.filePath)
        });
        var response = await dio.post(ApiPaths.createStoryUrl,
            data: formData, options: Options(headers: {"token": token}));
        if (response.statusCode == 200) {
          print(response.data.toString());
          return true;
        } else {
          // print(res.body);
          return Future.error("Failed trying to add story!");
        }
      } else {
        return Future.error("Failed trying to add story!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Story Creation Failed!');
    }
  }
}
