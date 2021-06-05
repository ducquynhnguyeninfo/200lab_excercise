class AppData {
  static final AppData _appData = new AppData._internal();
  String appName = "Tinder App";
  String env = '';
  int version = 0;

  String apiHost = 'api.dating.200lab.dev';
  String apiVersion = 'v1';
  String apiUrl = "";

  String dbName = 'app_db_16';

  double widthScreen = 0;
  double heightScreen = 0;

  String pusherKey = "";
  String pusherCluster = "";
  Map<String, dynamic> downloadProcess = Map();
  factory AppData() {
    return _appData;
  }
  AppData._internal();
}

final appData = AppData();
