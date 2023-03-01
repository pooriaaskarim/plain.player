import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_event.dart';
import '../bloc/splash_screen_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) =>
            BlocProvider.of<SplashScreenBloc>(context)..add(OnInit()),
        child: BlocConsumer<SplashScreenBloc, SplashScreenState>(
          listener: (final context, final state) async {
            if (state is SuccessState) {
              await AppUtils.fakeDelay(seconds: 2);
              await Navigator.of(context)
                  .popAndPushNamed(AppRouteNames.homePage);
            }
          },
          builder: (final context, final state) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
                  state.logoWidget,
                  AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
                  SizedBox(
                    height: AppUtils.xLargeSize,
                    width: AppUtils.xLargeSize,
                    child: state.loadingWidget,
                  ),
                  AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
                ],
              ),
            ),
          ),
        ),
      );
}
