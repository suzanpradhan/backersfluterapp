import 'package:backersapp/constants/api_paths.dart';
import 'package:backersapp/modules/auth/services/secure_storage.dart';
import 'package:backersapp/modules/notifications/models/notification_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationRepo {
  Future<List<NotificationModel>> getNotification() async {
    try {
      SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getLocalToken();
      if (token != null) {
        var url = Uri.parse(ApiPaths.notificationsURl);
        var res = await http.get(url,
            headers: {"token": token}).timeout(const Duration(seconds: 10));
        print(res.body);
        if (res.statusCode == 200) {
          List<NotificationModel> data =
              (jsonDecode(res.body)["results"] as List)
                  .map((postData) =>
                      NotificationModel.fromJsonForGetAllPosts(map: postData))
                  .toList();
          return data;
        } else {
          print(res.body);
          return Future.error("Notifications Load Failed!");
        }
      } else {
        return Future.error("Notifications Load Failed!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Notifications Load Failed!');
    }
  }
}
