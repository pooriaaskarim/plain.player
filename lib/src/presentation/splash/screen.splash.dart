import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/plain/bloc.plain.dart';
import '../../application/splash/cubit.splash.dart';
import '../../application/splash/state/state.splash.dart';
import '../../infrastructure/repositories/repository.configurations.dart';
import '../../infrastructure/repositories/repository.settings.dart';
import '../../infrastructure/utils/app.sizes.dart';
import '../../infrastructure/utils/app.utils.dart';
import 'widgets/loading/widget.splash_loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    this.logoScaleDownFactor = 2.1,
    super.key,
  });

  final double logoScaleDownFactor;

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final _) => SplashCubit(
          animationDuration: const Duration(seconds: 1),
          navigatorState: Navigator.of(context),
          plainBloc: BlocProvider.of<PlainBloc>(context),
          configurationsRepository:
              RepositoryProvider.of<ConfigurationsRepository>(context),
          settingsRepository:
              RepositoryProvider.of<SettingsRepository>(context),
        )..loadSettings(),
        child: BlocBuilder<SplashCubit, SplashState>(
          buildWhen: (final previous, final current) =>
              previous.runtimeType != current.runtimeType,
          builder: (final context, final state) {
            final Widget verticalSpacer =
                AppUtils.verticalSpacer(size: AppSizes.points_64);

            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildLogo(
                    BlocProvider.of<SplashCubit>(context).animationDuration,
                  ),
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
    final Duration animationDuration,
  ) =>
      SplashLoading(
        scaleDownFactor: logoScaleDownFactor,
        animationDuration: animationDuration,
      );

  Widget buildStateWidget(
    final BuildContext context,
    final SplashState state,
  ) =>
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.points_0,
          horizontal: AppSizes.points_16,
        ),
        height: AppSizes.points_48,
        width: MediaQuery.of(context).size.width,
        child: state.widget ?? AppUtils.emptyWidget,
      );
}
