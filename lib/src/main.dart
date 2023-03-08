import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infrastructure/routes/route_names.dart';
import 'infrastructure/routes/routes.dart';
import 'pages/settings/bloc/settings_bloc.dart';
import 'pages/settings/bloc/settings_state.dart';
import 'pages/splash/views/splash_screen.dart';

void main() async {
  runApp(
    const PoodApp(),
  );
}

class PoodApp extends StatelessWidget {
  const PoodApp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final GlobalKey<State<MaterialApp>> appKey =
        GlobalKey<State<MaterialApp>>();
    final GlobalKey splashScreenKey = GlobalKey();

    return BlocProvider(
      create: (final context) => SettingsBloc(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (final context, final settingsState) => MaterialApp(
          key: appKey,
          home: SplashScreen(key: splashScreenKey),
          title: 'just Plain',
          theme: settingsState.themeData,
          onGenerateRoute: (final routeSettings) => AppRoutes.getRoute(
            routeSettings.name ?? AppRouteNames.unknownPage,
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
