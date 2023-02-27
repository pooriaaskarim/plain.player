import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/utils/app_utils.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
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
              ElevatedButton(
                  onPressed: () => BlocProvider.of<SettingsBloc>(context)
                      .add(OnToggleTheme()),
                  child: Text(
                    'Toggle Theme',
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
            ],
          )),
    );
  }
}
