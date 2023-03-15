import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/settings/settings.bloc.dart';
import '../../application/splash/splash.bloc.dart';
import '../../application/splash/splash.event.dart';
import '../../application/splash/splash.state.dart';
import '../../infrastructure/utils/app_utils.dart';
import 'widgets/loading/loading_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    this.logoScaleDownFactor = 2.1,
    super.key,
  });
  final double logoScaleDownFactor;

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => SplashBloc(
          settingsBloc: BlocProvider.of<SettingsBloc>(context),
          navigatorState: Navigator.of(context),
        )..add(
            const OnInit(
              themeMode: ThemeMode.light,
            ),
          ),
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (final context, final state) {
            final Widget verticalSpacer =
                AppUtils.verticalSpacer(size: AppUtils.xxxLargeSize);

            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildLogo(state),
                  verticalSpacer,
                  buildStateWidget(context, state),
                  verticalSpacer,
                  verticalSpacer,
                ],
              ),
            );
          },
        ),
      );

  Widget buildLogo(
    final SplashState state,
  ) =>
      LoadingWidget(
        scaleDownFactor: logoScaleDownFactor,
      );

  Widget buildStateWidget(
    final BuildContext context,
    final SplashState state,
  ) =>
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: AppUtils.zero,
          horizontal: AppUtils.mediumSize,
        ),
        height: AppUtils.xxLargeSize,
        width: MediaQuery.of(context).size.width,
        child: state.stateWidget ?? AppUtils.emtyWidget,
      );
}
