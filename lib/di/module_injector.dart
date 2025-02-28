import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvc/services/network/network_constants.dart';
import 'package:flutter_mvc/services/network/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioInjector {
  @lazySingleton
  Dio dio(NetworkConstants _networkConstants) => Dio(
    BaseOptions(
      baseUrl: _networkConstants.baseUrl,
      receiveTimeout: const Duration(milliseconds: 60000),
      connectTimeout: const Duration(milliseconds: 60000),
      sendTimeout: const Duration(milliseconds: 60000),
    ),
  );
}

@module
abstract class ModulesInjector {
  @lazySingleton
  Logger get logger => Logger();

  @preResolve
  Future<SharedPreferences> get sharedPreference =>
      SharedPreferences.getInstance();

  @lazySingleton
  PrettyDioLogger get prettyDioLogger {
    return kDebugMode
        ? PrettyDioLogger(
          requestBody: true,
          error: true,
          request: true,
          compact: true,
          maxWidth: 90,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
        )
        : PrettyDioLogger(
          requestBody: false,
          error: false,
          request: false,
          compact: false,
          maxWidth: 0,
          requestHeader: false,
          responseBody: false,
          responseHeader: false,
        );
  }

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
