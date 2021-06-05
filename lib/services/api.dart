import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ft01_flutter_tinder_app/models/login.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<LoginModel?> login(
      {required String username,
      required String pwd,
      required Function(String) error,
      required Function(LoginModel) done}) async {
    String endpoint = 'https://api.dating.200lab.dev/v1/auth';
    try {
      http.Response response = await http.post(Uri.parse(endpoint),
          body: {'username': username, 'password': pwd});
      final rawjson = json.decode(response.body);
      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(rawjson['data']);
        done(model);
        return model;
      } else {
        // do something
      }
    } on SocketException catch (s) {
      throw s;
    } catch (e) {
      error(e.toString());
    }
    return null;
  }

  Future<void> loginWithDio(
      {required String username,
      required String pwd,
      required Function(LoginModel) done,
      required Function(String) error}) async {
    var dio = Dio();
    try {
      Response response = await dio.post(
          'https://api.dating.200lab.dev/v1/auth',
          data: {'username': username, 'password': pwd});
      if (response.statusCode == 200) {
        final rawjson = json.decode(response.data);
        LoginModel model = LoginModel.fromJson(rawjson['data']);
        done(model);
      }
    } on SocketException catch (e) {
      throw e;
    } catch (e) {}
  }
}
