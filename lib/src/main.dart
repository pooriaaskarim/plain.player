import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/settings/settings.bloc.dart';
import 'application/settings/settings.state.dart';
import 'infrastructure/routes/route_names.dart';
import 'infrastructure/routes/routes.dart';
import 'infrastructure/theme/app_theme.dart';
import 'presentation/splash/splash.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const PlainApp(),
  );
}

class PlainApp extends StatelessWidget {
  const PlainApp({
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
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settingsState.settings.themeConfig.themeMode,
          onGenerateRoute: (final routeSettings) => AppRoutes.getRoute(
            routeSettings.name ?? AppRouteNames.unknownPage,
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
