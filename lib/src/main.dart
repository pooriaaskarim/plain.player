import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'application/audio_library/cubit.audio_library.dart';
import 'application/plain/bloc.plain.dart';
import 'application/plain/states/state.plain.dart';
import 'infrastructure/config/routes/app.route_names.dart';
import 'infrastructure/config/routes/app.routes.dart';
import 'infrastructure/config/theme/app.theme.dart';
import 'infrastructure/repositories/repository.audio.dart';
import 'infrastructure/repositories/repository.configurations.dart';
import 'infrastructure/repositories/repository.settings.dart';
import 'presentation/splash/screen.splash.dart';

void main() async {
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
            create: (final _) => const SettingsRepository(),
          ),
          RepositoryProvider(
            lazy: true,
            create: (final _) => const ConfigurationsRepository(),
          ),
          RepositoryProvider(
            lazy: true,
            create: (final _) => const AudioRepository(),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (final context) => AudioLibraryCubit(
                audioRepository:
                    RepositoryProvider.of<AudioRepository>(context),
              ),
              lazy: true,
            ),
            BlocProvider(
              create: (final context) => PlainBloc(
                audioPlayer: AudioPlayer(),
                // audioLibraryHandler:
                //     BlocProvider.of<AudioLibraryCubit>(context),
                settingsRepository:
                    RepositoryProvider.of<SettingsRepository>(context),
                configurationsRepository:
                    RepositoryProvider.of<ConfigurationsRepository>(context),
              ), //todo: AudioPlayer ->SingleTon??!
            ),
          ],
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
