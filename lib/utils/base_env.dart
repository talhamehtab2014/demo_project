import 'package:injectable/injectable.dart';

import 'enums.dart';

@lazySingleton
class BaseEnv {
  AppEnv _currentAppEnv = AppEnv.staging;

  void setEnv(AppEnv appEnv) => _currentAppEnv = appEnv;

  AppEnv get currentAppEnv => _currentAppEnv;
}
