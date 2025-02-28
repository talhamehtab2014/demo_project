import 'package:flutter_mvc/utils/extensions.dart';
import 'package:injectable/injectable.dart';

import 'network_constants.dart';

@lazySingleton
class BaseUrlParser {
  final NetworkConstants _constants;
  late final Map<String, String> _baseUrlBasedOnEndpoint;

  BaseUrlParser(this._constants) {
    _baseUrlBasedOnEndpoint = <String, String>{};
  }

  String parse(String endpoint) =>
      _baseUrlBasedOnEndpoint.getWithDefault(endpoint, _constants.baseUrl);
}
