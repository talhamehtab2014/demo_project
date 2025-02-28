import 'package:flutter_mvc/ui/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final Routes _sharedInstance = Routes._internal();

  factory Routes() {
    return _sharedInstance;
  }

  Routes._internal();

  String getHomeScreen() => HomeScreen.id;

  List<GetPage> routeMap = [
    GetPage(
      name: HomeScreen.id,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
