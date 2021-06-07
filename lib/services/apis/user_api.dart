import 'package:ft01_flutter_tinder_app/models/user.dart';
import 'package:ft01_flutter_tinder_app/services/http_services.dart';
import 'package:ft01_flutter_tinder_app/values/app_data.dart';

class UserApi {
  String endpoint = 'users';

  late HttpService httpService;

  UserApi() {
    httpService = new HttpService();
    httpService.withHost(appData.apiHost);
    httpService.withVersion(appData.apiVersion);
    httpService.withPath(endpoint);
  }

  Future<List<User>> getUsers(
      {int? limit,
      int? page,
      String? cursor,
      int? minAge,
      String? roleId,
      String? typeIds}) async {
    httpService.makeGet();
    return httpService.execute().then((ResponseObject responseObject) {
      List<User> newList = (responseObject.data as List<dynamic>)
          .map((e) => User.fromJson(e))
          .toList();
      return newList;
    }).catchError((onError) {
      throw onError;
    });
  }
}
