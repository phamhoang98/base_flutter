
import 'dart:convert';

import '../../index.dart';

class LoginApiProvider{
  final String baseUrl = "${LinkApi.domain}/login";

  Future<UserModel> login({required String username,required String password}) async{
      final data = jsonEncode({
        "username": username,
        "password": password
      });
      final response = await NetWork().postHttp(url: baseUrl,data: data);
      return UserModel.fromJson(response.data);
  }

}