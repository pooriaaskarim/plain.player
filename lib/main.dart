import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/infrastructure/routes/route_names.dart';
import 'src/infrastructure/routes/routes.dart';
import 'src/pages/settings/bloc/settings_bloc.dart';
import 'src/pages/settings/bloc/settings_state.dart';
import 'src/pages/splash/bloc/splash_screen_bloc.dart';
import 'src/pages/splash/views/splash_screen.dart';

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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(
            create: (context) => SplashScreenBloc(
                  settingsBloc: BlocProvider.of<SettingsBloc>(context),
                )),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          return MaterialApp(
            home: const SplashScreen(),
            title: 'just Pood',
            theme: settingsState.themeData,
            onGenerateRoute: (routeSettings) => AppRoutes.getRoute(
                routeSettings.name ?? AppRouteNames.unknownPage),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
