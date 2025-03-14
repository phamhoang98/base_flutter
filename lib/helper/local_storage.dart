import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../index.dart';

class LocalStorage {
  static final LocalStorage _singleton = LocalStorage._internal();

  LocalStorage._internal();

  factory LocalStorage() {
    return _singleton;
  }

  Future<void> saveAccountStorage({required UserModel user}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(ACCOUNT, jsonEncode(user.toJson()));
  }

  Future<UserModel?> getAccountStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? jsonData =  prefs.getString(ACCOUNT);
    if (jsonData != null) {
      Map<String, dynamic> account = jsonDecode(jsonData);
      return  UserModel.fromJson(account);
    }
    return null;
  }

  Future<void> saveAccessToken({required AccessTokenModel accessToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(ACCESS_TOKEN,  jsonEncode(accessToken.toJson()));
  }

  Future<AccessTokenModel?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData =  prefs.getString(ACCESS_TOKEN);
    if (jsonData != null) {
      Map<String, dynamic> account = jsonDecode(jsonData);
      return  AccessTokenModel.fromJson(account);
    }
    return null;
  }
}
