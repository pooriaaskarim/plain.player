import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/splash/cubit.splash.dart';
import '../../../../infrastructure/utils/app.sizes.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    required this.errorMessage,
    super.key,
  });
  final String errorMessage;

  @override
  Widget build(final BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);

    return IconButton(
      onPressed: () => scaffoldMessengerState
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: themeData.textTheme.bodySmall
                  ?.copyWith(color: themeData.colorScheme.onError),
            ),
            backgroundColor: themeData.colorScheme.error,
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () =>
                  BlocProvider.of<SplashCubit>(context).loadSettings(),
            ),
          ),
        ),
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.error,
        size: AppSizes.points_48,
        color: themeData.colorScheme.error,
      ),
    );
  }
}
