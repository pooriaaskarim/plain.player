import 'package:flutter/material.dart';

import '../../pages/main/main_screen.dart';
import '../../pages/settings/views/settings_page.dart';
import '../../pages/splash/views/splash_screen.dart';
import '../../pages/unknown/views/unknown_page.dart';
import 'route_names.dart';

class AppRoutes {
  static MaterialPageRoute getRoute(String routeName) {
    return routes.containsKey(routeName)
        ? routes[routeName]!()
        : routes[AppRouteNames.homePage];
  }

  static Map<String, Function> routes = {
    AppRouteNames.splashScreen: () => MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
    AppRouteNames.homePage: () => MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
    AppRouteNames.settingsPage: () => MaterialPageRoute(
          builder: (context) => const Settings(),
        ),
    AppRouteNames.unknownPage: () => MaterialPageRoute(
          builder: (context) => const Unknown(),
        ),
  };
}
