import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'application/plain/bloc.plain.dart';
import 'application/plain/state.plain.dart';
import 'infrastructure/repositories/repository.audio.dart';
import 'infrastructure/repositories/repository.configurations.dart';
import 'infrastructure/repositories/repository.settings.dart';
import 'infrastructure/routes/route_names.dart';
import 'infrastructure/routes/routes.dart';
import 'infrastructure/theme/app_theme.dart';
import 'presentation/splash/screen.splash.dart';

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
  Widget build(final BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            lazy: true,
            create: (final context) => const SettingsRepository(),
          ),
          RepositoryProvider(
            lazy: true,
            create: (final context) => const ConfigurationsRepository(),
          )
        ],
        child: BlocProvider(
          create: (final context) => PlainBloc(
            audioPlayer: AudioPlayer(),
            settingsRepository:
                RepositoryProvider.of<SettingsRepository>(context),
            configurationsRepository:
                RepositoryProvider.of<ConfigurationsRepository>(context),
          ), //todo: AudioPlayer ->SingleTon??!
          child: BlocBuilder<PlainBloc, PlainState>(
            builder: (final context, final plainState) => MaterialApp(
              home: const SplashScreen(),
              title: "Plain",
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: plainState.settings.themeConfig.themeMode,
              onGenerateRoute: (final routeSettings) => AppRoutes.getRoute(
                routeSettings.name ?? AppRouteNames.unknownPage,
              ),
              debugShowCheckedModeBanner: false,
            ),
          ),
        ),
      );
}
