import 'dart:convert';

import 'package:backersapp/constants/api_paths.dart';
import 'package:backersapp/gb_models/post_model_gb.dart';
import 'package:backersapp/modules/auth/models/user_model.dart';
import 'package:backersapp/modules/auth/services/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Postrepo {
  Future<List<PostModelGb>> getAllPosts() async {
    try {
      var url = Uri.parse(ApiPaths.getAllPostsUrl);
      var res = await http
          .get(
            url,
          )
          .timeout(const Duration(seconds: 10));
      print(res.body);
      if (res.statusCode == 200) {
        List<PostModelGb> data = (jsonDecode(res.body)["results"] as List)
            .map(
                (postData) => PostModelGb.fromJsonForGetAllPosts(map: postData))
            .toList();
        return data;
      } else {
        print(res.body);
        return Future.error("Post Load Failed!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Post Load Failed!');
    }
  }

  Future<List<PostModelGb>> getMyPosts() async {
    try {
      SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getLocalToken();
      var url = Uri.parse(ApiPaths.getMyPostsUrl);
      var res = await http.get(url,
          headers: {"token": token!}).timeout(const Duration(seconds: 10));
      print(res.body);
      if (res.statusCode == 200) {
        List<PostModelGb> data = (jsonDecode(res.body)["results"] as List)
            .map(
                (postData) => PostModelGb.fromJsonForGetAllPosts(map: postData))
            .toList();
        return data;
      } else {
        print(res.body);
        return Future.error("Post Load Failed!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Post Load Failed!');
    }
  }

  Future<bool> createNewPost({required PostModelGb postModelGb}) async {
    try {
      var dio = Dio();

      SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getLocalToken();

      if (token != null) {
        var formData = FormData.fromMap({
          'description': postModelGb.description,
          'isPublic': true,
          'post_asset_type': 1,
          'file': await MultipartFile.fromFile(postModelGb.filePath!,
              filename: postModelGb.filePath)
        });
        var response = await dio.post(ApiPaths.createPostUrl,
            data: formData, options: Options(headers: {"token": token}));
        if (response.statusCode == 200) {
          print(response.data.toString());
          return true;
        } else {
          // print(res.body);
          return Future.error("Failed trying to post!");
        }
      } else {
        return Future.error("Failed trying to post!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Post Creation Failed!');
    }
  }

  Future<String> createDonation(
      {required double amount, required int postId}) async {
    try {
      var dio = Dio();

      SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getLocalToken();

      if (token != null) {
        var url = Uri.parse(ApiPaths.donationUrl);
        var res = await http.post(url,
            body: {'amount': amount.toString(), 'post': postId.toString()},
            headers: {"token": token}).timeout(const Duration(seconds: 10));
        if (res.statusCode == 200) {
          print(res.body.toString());
          return res.body.toString();
        } else if (res.statusCode == 406) {
          return Future.error(jsonDecode(res.body)["detail"]);
        } else {
          // print(res.body);
          return Future.error("Donation failed!");
        }
      } else {
        return Future.error("Donation failed!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Donation failed!');
    }
  }
}
