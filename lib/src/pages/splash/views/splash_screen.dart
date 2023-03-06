import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/theme/app_theme.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../../settings/bloc/settings_bloc.dart';
import '../bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_event.dart';
import '../bloc/splash_screen_state.dart';
import 'widgets/loading_widget.dart';

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
                AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
                buildTooltip(state),
                AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
              ],
            ),
          ),
        ),
      );

  LoadingWidget buildLogo(
          final SplashScreenState state, final BuildContext context) =>
      LoadingWidget(
        themeData: state.themeData,
        screenWidth: MediaQuery.of(context).size.width,
        scaleDownFactor: logoScaleDownFactor,
      );

  Tooltip buildTooltip(final SplashScreenState state) => Tooltip(
        message: state.statusWidgetTooltip ?? '',
        preferBelow: false,
        verticalOffset: AppUtils.largeSize,
        enableFeedback: true,
        textStyle: state.themeData.textTheme.labelSmall?.copyWith(
          color: state.themeData.colorScheme.onError,
        ),
        decoration: BoxDecoration(
          color: state.themeData.colorScheme.error,
          shape: BoxShape.rectangle,
        ),
        child: SizedBox(
          height: AppUtils.xLargeSize,
          width: AppUtils.xLargeSize,
          child: state.statusWidget ?? AppUtils.emtyWidget,
        ),
      );
}
