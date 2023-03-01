import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_player_bloc.dart';
import '../../bloc/main_player_event.dart';
import '../../bloc/main_player_state.dart';
import 'widgets/main_button/main_button.dart';

class MainPlayer extends StatelessWidget {
  const MainPlayer({super.key});

  @override
  Widget build(final BuildContext context) {
    final GlobalKey<MainButtonState> mainButtonKey =
        GlobalKey<MainButtonState>();
    return BlocProvider(
      create: (final context) =>
          BlocProvider.of<MainPlayerBloc>(context)..add(const OnInit()),
      child: BlocBuilder<MainPlayerBloc, MainPlayerState>(
        builder: (final context, final state) => Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainButton(
              key: mainButtonKey,
              audioPlayer: state.audiPlayer,
            )
          ],
        ),
      ),
    );
  }
}
