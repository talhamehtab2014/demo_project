import 'package:flutter/material.dart';
import 'package:flutter_mvc/utils/base_env.dart';
import 'package:flutter_mvc/utils/enums.dart';

import 'di/di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  sl<BaseEnv>().setEnv(AppEnv.production);
  runApp(const MyApp());
}
