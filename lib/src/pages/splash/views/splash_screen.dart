import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/theme/app_theme.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../../settings/bloc/settings_bloc.dart';
import '../bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_event.dart';
import '../bloc/splash_screen_state.dart';
import 'widgets/loading/loading_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    this.logoScaleDownFactor = 2.1,
    super.key,
  });
  final double logoScaleDownFactor;

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => SplashScreenBloc(
          settingsBloc: BlocProvider.of<SettingsBloc>(context),
          navigatorState: Navigator.of(context),
        )..add(
            OnInit(
              themeData: AppTheme.lightTheme,
            ),
          ),
        child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (final context, final state) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildLogo(state, context),
                AppUtils.verticalSpacer(size: AppUtils.xxxLargeSize),
                buildStateWidget(state),
                AppUtils.verticalSpacer(size: AppUtils.xxxLargeSize),
                AppUtils.verticalSpacer(size: AppUtils.xxxLargeSize),
              ],
            ),
          ),
        ),
      );

  Widget buildLogo(
    final SplashScreenState state,
    final BuildContext context,
  ) =>
      LoadingWidget(
        themeData: state.themeData,
        screenWidth: MediaQuery.of(context).size.width,
        scaleDownFactor: logoScaleDownFactor,
      );

  Widget buildStateWidget(final SplashScreenState state) => SizedBox(
        height: AppUtils.xxLargeSize,
        width: AppUtils.xxLargeSize,
        child: state.stateWidget ?? AppUtils.emtyWidget,
      );
}
