import 'dart:convert';
import 'package:app_tiktok/enity/auth/login_request.dart';
import 'package:app_tiktok/enity/auth/login_response.dart';
import 'package:app_tiktok/enity/auth/user.dart';
import 'package:dio/dio.dart';



class LoginService {
  static const String baseUrl = 'https://dummyjson.com/auth';

  static Dio dio = Dio();
  static Future<LoginResponse?> login(LoginRequest loginRequest) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var data = loginRequest.toJson();

      var response = await dio.post(
        '$baseUrl/login',
        data: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return LoginResponse.fromJson(response.data);
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      print('Login request failed: $e');
      return null;
    }
  }

  static Future<User?> getCurrentUser(String accessToken) async {
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await dio.get(
        '$baseUrl/me',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print("234" + json.encode(response.data));
        return User.fromJson(response.data);
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
      return null;
    }
  }
}
