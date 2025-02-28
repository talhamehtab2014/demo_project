// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_mvc/di/module_injector.dart' as _i818;
import 'package:flutter_mvc/services/network/base_url_parser.dart' as _i4;
import 'package:flutter_mvc/services/network/error_handler.dart' as _i214;
import 'package:flutter_mvc/services/network/network_call.dart' as _i689;
import 'package:flutter_mvc/services/network/network_constants.dart' as _i54;
import 'package:flutter_mvc/services/network/network_info.dart' as _i944;
import 'package:flutter_mvc/services/network/network_info_impl.dart' as _i688;
import 'package:flutter_mvc/services/network/pretty_dio_logger.dart' as _i255;
import 'package:flutter_mvc/utils/base_env.dart' as _i1050;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final modulesInjector = _$ModulesInjector();
    final dioInjector = _$DioInjector();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => modulesInjector.sharedPreference,
      preResolve: true,
    );
    gh.lazySingleton<_i974.Logger>(() => modulesInjector.logger);
    gh.lazySingleton<_i255.PrettyDioLogger>(
      () => modulesInjector.prettyDioLogger,
    );
    gh.lazySingleton<_i895.Connectivity>(() => modulesInjector.connectivity);
    gh.lazySingleton<_i1050.BaseEnv>(() => _i1050.BaseEnv());
    gh.factory<_i944.NetworkInfo>(
      () => _i688.NetworkInfoImp(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i54.NetworkConstants>(
      () => _i54.NetworkConstants(gh<_i1050.BaseEnv>()),
    );
    gh.lazySingleton<_i214.ErrorHandler>(() => _i214.ErrorHandlerImp());
    gh.lazySingleton<_i361.Dio>(
      () => dioInjector.dio(gh<_i54.NetworkConstants>()),
    );
    gh.lazySingleton<_i4.BaseUrlParser>(
      () => _i4.BaseUrlParser(gh<_i54.NetworkConstants>()),
    );
    gh.lazySingleton<_i689.NetworkCall>(
      () => _i689.NetworkCallImp(
        dio: gh<_i361.Dio>(),
        errorHandler: gh<_i214.ErrorHandler>(),
        prettyDioLogger: gh<_i255.PrettyDioLogger>(),
        baseUrlParser: gh<_i4.BaseUrlParser>(),
      ),
    );
    return this;
  }
}

class _$ModulesInjector extends _i818.ModulesInjector {}

class _$DioInjector extends _i818.DioInjector {}
