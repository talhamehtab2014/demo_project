import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:injectable/injectable.dart';

part 'failure.dart';

abstract class ErrorHandler {
  static const String ClientProtocolException = 'clientError';
  static const String RANDOM_ERROR = '';
  static const String TIME_OUT = '401';
  static const String NO_DATA_FOUND = '70110';

  Failure resolveErrors({required Response<dynamic> response});

  Failure handleStatusCode(int statusCode, {String? desc});

  Failure throwDefaultFailure();

  Failure throwImageDefaultFailure();

  Failure mapErrorCodeToFailure(
    String errorCode, {
    String errorDescription = '',
  }) {
    debugPrint("mapErrorCodeToFailure : $errorCode -> $errorDescription");
    switch (errorCode) {
      case TIME_OUT:
        return const TimeoutFailure();
      case NO_DATA_FOUND:
        return const NoDataFoundFailure();
      default:
        if (errorDescription.isEmpty || errorDescription.length > 100) {
          return const SomethingWentWrongFailure();
        } else {
          return DefaultFailure(errorDescription);
        }
    }
  }

  String getErrorMessageFromErrorCode({
    required String? errorCode,
    String? errorDescription,
  }) {
    errorDescription ??= "";
    switch (errorCode) {
      case TIME_OUT:
        return 'time_out'.tr;
      case NO_DATA_FOUND:
        return 'no_data_found'.tr;
      default:
        if (errorDescription.isEmpty || errorDescription.length > 100) {
          return 'something_went_wrong'.tr;
        } else {
          return errorDescription;
        }
    }
  }
}

@LazySingleton(as: ErrorHandler)
class ErrorHandlerImp extends ErrorHandler {
  @override
  Failure resolveErrors({required Response<dynamic> response}) {
    return handleStatusCode(
      response.statusCode ?? 0,
      desc: response.statusMessage,
    );
  }

  @override
  Failure handleStatusCode(int statusCode, {String? desc}) {
    debugPrint("handleStatusCode: $desc");
    return mapErrorCodeToFailure(
      statusCode.toString(),
      errorDescription: desc ?? '',
    );
  }

  @override
  Failure throwDefaultFailure() {
    return DefaultFailure('something_went_wrong');
  }

  @override
  Failure throwImageDefaultFailure() {
    return DefaultFailure('network_error_please_try_again');
  }
}
