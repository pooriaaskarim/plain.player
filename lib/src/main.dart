import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infrastructure/routes/route_names.dart';
import 'infrastructure/routes/routes.dart';
import 'pages/settings/bloc/settings_bloc.dart';
import 'pages/settings/bloc/settings_state.dart';
import 'pages/splash/bloc/splash_screen_bloc.dart';
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
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (final context) => SettingsBloc()),
          BlocProvider(
            create: (final context) => SplashScreenBloc(
              settingsBloc: BlocProvider.of<SettingsBloc>(context),
            ),
          ),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (final context, final settingsState) => MaterialApp(
            home: const SplashScreen(),
            title: 'just Pood',
            theme: settingsState.themeData,
            onGenerateRoute: (final routeSettings) => AppRoutes.getRoute(
              routeSettings.name ?? AppRouteNames.unknownPage,
            ),
            debugShowCheckedModeBanner: false,
          ),
        ),
      );
}
