import 'dart:convert';

import 'package:backersapp/constants/api_paths.dart';
import 'package:backersapp/constants/route_constants.dart';
import 'package:backersapp/modules/auth/models/user_model.dart';
import 'package:backersapp/modules/auth/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  Future<UserModel> registerService({required UserModel userModel}) async {
    try {
      print(userModel.toJsonForRegistration());
      var url = Uri.parse(ApiPaths.registerUrl);
      var res = await http
          .post(
            url,
            body: userModel.toJsonForRegistration(),
          )
          .timeout(const Duration(seconds: 10));
      if (res.statusCode == 200) {
        UserModel data = UserModel.fromJsonForTokens(map: jsonDecode(res.body));
        return data;
      } else {
        print(res.body);
        return Future.error("User Registration Failed!");
      }
    } catch (e) {
      print(e.toString());
      return Future.error('User Registration Failed!');
    }
  }

  Future<UserModel> loginService({required UserModel userModel}) async {
    try {
      var url = Uri.parse(ApiPaths.loginUrl);
      var res = await http
          .post(
            url,
            body: userModel.toJsonForLogin(),
          )
          .timeout(const Duration(seconds: 10));
      if (res.statusCode == 200) {
        UserModel data = UserModel.fromJsonForTokens(map: jsonDecode(res.body));
        return data;
      } else {
        return Future.error("User Authentication Failed!");
      }
    } catch (e) {
      return Future.error('User Authentication Failed!');
    }
  }

  Future<double> getMyWallet() async {
    try {
      var url = Uri.parse(ApiPaths.myWalletUrl);

      SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getLocalToken();
      if (token != null) {
        var res = await http.get(url,
            headers: {"token": token}).timeout(const Duration(seconds: 10));
        print(res.body);
        if (res.statusCode == 200) {
          double data = jsonDecode(res.body)["creditInCents"] / 100;
          return data;
        } else {
          print(res.body);
          return Future.error("Wallet Load Failed!");
        }
      } else {
        return Future.error('Server Error!');
      }
    } catch (e) {
      print(e.toString());
      return Future.error('Wallet Load Failed!');
    }
  }

  Future<bool> autoAuthenticationAttempt() async {
    try {
      SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getLocalToken();
      if (token != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future logout(BuildContext context) async {
    await SecureStorage().deleteLocalToken();
    Navigator.pushNamed(context, SPLASH_ROUTE);
  }
}
