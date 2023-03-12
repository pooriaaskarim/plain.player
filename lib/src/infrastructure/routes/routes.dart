import 'package:flutter/material.dart';

import '../../pages/main/ui/main_page.dart';
import '../../pages/settings/views/settings_page.dart';
import '../../pages/splash/views/splash_screen.dart';
import '../../pages/unknown/views/unknown_page.dart';
import 'route_names.dart';

class AppRoutes {
  static MaterialPageRoute getRoute(final String routeName) =>
      routes.containsKey(routeName)
          ? routes[routeName]!()
          : routes[AppRouteNames.homePage];

  static Map<String, Function> routes = {
    AppRouteNames.splashScreen: () => MaterialPageRoute(
          builder: (final context) => const SplashScreen(),
        ),
    AppRouteNames.homePage: () => MaterialPageRoute(
          builder: (final context) => const MainPage(),
        ),
    AppRouteNames.settingsPage: () => MaterialPageRoute(
          builder: (final context) => const Settings(),
        ),
    AppRouteNames.unknownPage: () => MaterialPageRoute(
          builder: (final context) => const Unknown(),
        ),
  };
}
