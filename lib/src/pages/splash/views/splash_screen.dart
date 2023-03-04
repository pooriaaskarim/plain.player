import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/theme/app_theme.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_event.dart';
import '../bloc/splash_screen_state.dart';
import 'widgets/logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => BlocProvider.of<SplashScreenBloc>(context)
          ..add(
            OnInit(
              themeData: AppTheme.lightTheme,
            ),
          ),
        child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (final context, final state) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
                  Logo(
                    dotColor: state.themeData.colorScheme.tertiary,
                    logoColor: state.themeData.colorScheme.primary,
                  ),
                  AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
                  SizedBox(
                    height: AppUtils.xLargeSize,
                    width: AppUtils.xLargeSize,
                    child: state.statusWidget,
                  ),
                  AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
                ],
              ),
            ),
          ),
        ),
      );
}
