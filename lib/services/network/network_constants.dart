import 'package:flutter_mvc/utils/base_env.dart';
import 'package:flutter_mvc/utils/enums.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkConstants {
  final BaseEnv baseEnv;

  NetworkConstants(this.baseEnv);

  // -----------------------------------URLs-------------------------------------
  static const String BASE_URL = "http://DemoBaseUrl";

  static const String _STAGE_BASE_URL = '$BASE_URL/Staging';

  static const String _PROD_BASE_URL = '$BASE_URL/Prod';

  static const String _loginRequestURL = "demoLoginEndpoint";

  //-------------------- Getters --------------------------------------------

  String get baseUrl =>
      baseEnv.currentAppEnv == AppEnv.staging
          ? _STAGE_BASE_URL
          : _PROD_BASE_URL;

  String get stageBaseUrl => _STAGE_BASE_URL;

  String get prodBaseUrl => _PROD_BASE_URL;

  String get loginRequestUrl => _loginRequestURL;

  // -------------------- Methods --------------------------------------------

  // -------------------- Methods --------------------------------------------
}
