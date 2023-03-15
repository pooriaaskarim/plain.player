import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/settings/settings.bloc.dart';
import '../../application/settings/settings.event.dart';
import '../../domain/settings/theme_config.model.dart';
import '../../infrastructure/utils/app_utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.all(AppUtils.tinySize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PopupMenuButton<ThemeMode>(
                padding: EdgeInsets.zero,
                child: const Text('Theme Mode'),
                onSelected: (final value) {
                  BlocProvider.of<SettingsBloc>(context)
                    ..add(
                      SettingsEvent.update(
                        themeConfig: ThemeConfig(themeMode: value),
                      ),
                    )
                    ..add(SettingsEvent.load());
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
      );
}
