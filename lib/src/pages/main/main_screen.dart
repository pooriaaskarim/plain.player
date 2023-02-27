import 'package:flutter/material.dart';

import '../../infrastructure/utils/app_utils.dart';
import '../../widgets/header_button/header_button.dart';
import '../../widgets/play_button/models/playback_state.dart';
import '../../widgets/play_button/toggle_button.dart';
import 'widgets/home_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.all(AppUtils.tinySize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButton(initState: PlaybackState.stop, notifyParent: () {}),
              const HeaderButton(
                label: 'home',
              ),
            ],
          )),
    );
  }
}
