import 'package:pood/src/pages/splash/bloc/splash_screen_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) =>
          BlocProvider.of<SplashScreenBloc>(context)..add(OnInit()),
      child: BlocConsumer<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) async {
          if (state is SuccessState) {
            await AppUtils.fakeDelay(seconds: 2);
            Navigator.of(context).popAndPushNamed(AppRouteNames.homePage);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                    child: state.loadingWidget),
                AppUtils.verticalSpacer(size: AppUtils.xLargeSize),
              ],
            )),
          );
        },
      ));
}
