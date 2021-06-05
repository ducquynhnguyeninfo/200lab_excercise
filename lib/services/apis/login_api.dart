import 'dart:convert';

import 'package:ft01_flutter_tinder_app/models/login.dart';
import 'package:ft01_flutter_tinder_app/services/http_services.dart';
import 'package:ft01_flutter_tinder_app/values/app_data.dart';

class LoginApi {
  String endpoint = 'auth';

  late HttpService httpService;

  LoginApi() {
    httpService = new HttpService();
    httpService.withHost(appData.apiHost);
    httpService.withVersion(appData.apiVersion);
    httpService.withPath(endpoint);
  }

  Future<LoginModel> login(String user, String password) async {
    httpService.withParam({'username': user, 'password': password}).makePost();
    return httpService.execute().then((ResponseObject responseObject) {
      LoginModel loginModel = LoginModel.fromJson(responseObject.data);
      return loginModel;
    }).catchError((onError) {
      throw onError;
    });
  }
}
