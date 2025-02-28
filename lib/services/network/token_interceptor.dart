import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/di.dart';

class TokenInterceptors extends Interceptor {
  final Dio dio;

  TokenInterceptors(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authToken = await sl<SharedPreferences>().getString("AuthToken");

    /// Modify Header for the Network Call onRequest
    /// SET Auth Token
    if (authToken?.isNotEmpty ?? false) {
      options.headers.addAll({
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json; charset=UTF-8',
      });
    }

    /// End Data Modification =================================================================
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    return super.onError(err, handler);
  }
}
