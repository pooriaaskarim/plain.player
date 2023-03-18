import 'package:flutter/material.dart';

class FirstLaunchWidget extends StatelessWidget {
  const FirstLaunchWidget({super.key});

  @override
  Widget build(final BuildContext context) => Text(
        'App Initializing...',
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
      );
}
