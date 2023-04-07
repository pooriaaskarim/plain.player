import 'package:flutter/material.dart';

import '../../presentation/plain/screen.plain.dart';
import '../../presentation/settings/screen.settings.dart';
import '../../presentation/splash/screen.splash.dart';
import '../../presentation/unknown/screen.unknown.dart';
import 'app.route_names.dart';

class AppRoutes {
  AppRoutes._();
  static MaterialPageRoute getRoute(final String routeName) =>
      routes.containsKey(routeName)
          ? routes[routeName]!()
          : routes[AppRouteNames.homePage];

  static Map<String, Function> routes = {
    AppRouteNames.splashScreen: () => MaterialPageRoute(
          builder: (final context) => const SplashScreen(),
        ),
    AppRouteNames.homePage: () => MaterialPageRoute(
          builder: (final context) => const PlainScreen(),
        ),
    AppRouteNames.settingsPage: () => MaterialPageRoute(
          builder: (final context) => const SettingsScreen(),
        ),
    AppRouteNames.unknownPage: () => MaterialPageRoute(
          builder: (final context) => const UnknownScreen(),
        ),
  };
}
