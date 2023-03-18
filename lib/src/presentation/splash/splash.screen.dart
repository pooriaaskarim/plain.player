import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/plain/plain.bloc.dart';
import '../../application/splash/splash.cubit.dart';
import '../../application/splash/splash.state.dart';
import '../../infrastructure/repositories/repository.configurations.dart';
import '../../infrastructure/repositories/repository.settings.dart';
import '../../infrastructure/utils/app_utils.dart';
import 'widgets/loading/loading.widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    this.logoScaleDownFactor = 2.1,
    super.key,
  });

  final double logoScaleDownFactor;

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => SplashBloc(
          navigatorState: Navigator.of(context),
          plainBloc: BlocProvider.of<PlainBloc>(context),
          settingsRepository:
              RepositoryProvider.of<SettingsRepository>(context),
          configurationsRepository:
              RepositoryProvider.of<ConfigurationsRepository>(context),
        )..loadSettings(),
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
        child: state.widget ?? AppUtils.emtyWidget,
      );
}
