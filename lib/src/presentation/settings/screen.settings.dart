import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/plain/bloc.plain.dart';
import '../../application/settings/cubit.settings.dart';
import '../../application/settings/state.settings.dart';
import '../../domain/settings/model.theme_config.dart';
import '../../infrastructure/repositories/repository.settings.dart';
import '../../infrastructure/utils/app.utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
          ),
        ),
        body: BlocProvider(
          create: (final _) => SettingsCubit(
            plainBloc: BlocProvider.of<PlainBloc>(context),
            scaffoldMessengerState: ScaffoldMessenger.of(context),
            settingsRepository:
                RepositoryProvider.of<SettingsRepository>(context),
          )..load(),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (final context, final state) => Container(
              alignment: Alignment.center,
              margin: const EdgeInsetsDirectional.all(AppUtils.tinySize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PopupMenuButton<ThemeMode>(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Theme Mode: '
                      '${state.settings.themeConfig.themeMode.name}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onSelected: (final value) async {
                      final SettingsCubit settingsCubit =
                          BlocProvider.of<SettingsCubit>(context);

                      await settingsCubit.update(
                        themeConfig: ThemeConfig(themeMode: value),
                      );
                      await AppUtils.fakeDelay();
                      await settingsCubit.load();
                    },
                    itemBuilder: (final context) => const [
                      PopupMenuItem<ThemeMode>(
                        value: ThemeMode.system,
                        child: Text('System'),
                      ),
                      PopupMenuItem<ThemeMode>(
                        value: ThemeMode.light,
                        child: Text('Light'),
                      ),
                      PopupMenuItem<ThemeMode>(
                        value: ThemeMode.dark,
                        child: Text('Dark'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
