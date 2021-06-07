import 'dart:convert';
import 'package:ft01_flutter_tinder_app/services/share_services.dart';
import 'package:ft01_flutter_tinder_app/utils/helper.dart';
import 'package:ft01_flutter_tinder_app/values/app_data.dart';
import 'package:ft01_flutter_tinder_app/values/share_key.dart';
import 'package:http/http.dart' as http;

class HttpService {
  String host = AppData().apiHost;

  String method = '';
  Map<String, dynamic> params = new Map();
  Map<String, String> queries = new Map();
  List<String> paths = [];
  String urlRequest = '';
  HttpService();

  HttpService withUrl(String url) {
    String path = url.replaceAll(appData.apiUrl + '/', '');
    List<String> paths = [];
    this.host = appData.apiHost;
    paths.add(path);
    this.paths = paths;
    return this;
  }

  HttpService withHost(String host) {
    this.host = host;
    return this;
  }

  HttpService withVersion(String version) {
    paths.add(version);
    return this;
  }

  HttpService withPath(String path) {
    paths.add(path);
    return this;
  }

  HttpService makeGet() {
    this.method = 'GET';
    return this;
  }

  HttpService makePost() {
    this.method = 'POST';
    return this;
  }

  HttpService makePut() {
    this.method = 'PUT';
    return this;
  }

  HttpService makeDelete() {
    this.method = 'DELETE';
    return this;
  }

  HttpService withParam(Map<String, dynamic> params) {
    this.params.addAll(params);
    return this;
  }

  HttpService withQueries(Map<String, String> queries) {
    this.queries.addAll(queries);
    return this;
  }

  getHeader({bool? withToken}) async {
    Map<String, String> headers = Map();
    ShareService shareService = await ShareService().getInstance();
    if (withToken ?? false) {
      headers['Authorization'] =
          'bearer ${shareService.getString(ShareKey.token)}';
      headers['content-type'] = 'application/json';
    } else {
      headers['content-type'] = 'application/json';
    }
    return headers;
  }

  /// Call api service and notify error or response success data

  Future<ResponseObject> execute() async {
    var httpClient = http.Client();
    Map<String, String> headers = await this.getHeader(withToken: true);
    ResponseObject responseObject = new ResponseObject();
    Future<http.Response> exec;

    switch (method) {
      case 'GET':
        Uri uri = Uri.https(host, paths.join('/'));
        print(uri);
        exec = httpClient.get(Uri.https(host, paths.join('/'), queries),
            headers: headers);
        break;
      case 'POST':
        exec = httpClient.post(Uri.https(host, paths.join('/')),
            body: json.encode(params), headers: headers);
        break;
      case 'PUT':
        exec = httpClient.put(Uri.https(host, paths.join('/')),
            body: json.encode(params), headers: headers);
        break;
      case 'DELETE':
        exec = httpClient.delete(Uri.https(host, paths.join('/')),
            headers: headers);
        break;
      default:
        throw 'Method is required';
    }

    return exec.then((response) async {
      httpClient.close();

      if (response == null) {
        responseObject.errorMessage = 'Không xác định';
        throw responseObject;
      }
      responseObject.statusCode = response.statusCode;

      if (response.statusCode == 505) {
        responseObject.invalidVersion = true;
        responseObject.errorMessage = 'Yêu cầu update app';
        throw responseObject;
      }

      if ([503, 413, 500].contains(response.statusCode)) {
        responseObject.errorMessage = 'Không xác định';
        throw responseObject;
      }
      if (response.statusCode == 204) {
        return responseObject;
      }
      dynamic result = Helper.tryParseJson(utf8.decode(response.bodyBytes));
      if ([200, 201, 202, 203].contains(response.statusCode)) {
        responseObject.data = result['data'];
        return responseObject;
      }
      throw responseObject;
    }).catchError((onError) {
      throw responseObject;
    });
  }
}

class ResponseObject {
  int statusCode = -1;
  dynamic data;
  String errorCode = '';
  String errorMessage = '';
  bool isForceLogin = false;
  bool invalidVersion = false;
  ResponseObject();
}
