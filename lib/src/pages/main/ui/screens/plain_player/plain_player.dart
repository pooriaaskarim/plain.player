import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../../bloc/main_player_bloc.dart';
import '../../../bloc/main_player_event.dart';
import '../../../bloc/main_player_state.dart';
import 'widgets/main_button/plain_button_widget.dart';
import 'widgets/seeking_bar/seeking_bar.dart';

class PlainPlayer extends StatelessWidget {
  const PlainPlayer({super.key});

  @override
  Widget build(final BuildContext context) {
    final GlobalKey<PlainButtonWidgetState> mainButtonKey =
        GlobalKey<PlainButtonWidgetState>();
    Future<Directory> appDir = getApplicationDocumentsDirectory();

    return BlocProvider(
      create: (final context) =>
          BlocProvider.of<MainPlayerBloc>(context)..add(const OnInit()),
      child: BlocBuilder<MainPlayerBloc, MainPlayerState>(
        builder: (final context, final state) => Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlainButtonWidget(
              audioPlayer: state.audioPlayer,
              key: mainButtonKey,
            ),
            SeekingBar(audioPlayer: state.audioPlayer),
            ElevatedButton(
                onPressed: () async {
                  Directory _appDir = await appDir;

                  await showDialog(
                    context: context,
                    builder: (context) => Dialog.fullscreen(
                      backgroundColor: Colors.teal,
                      child: Text('${_appDir.path}'),
                    ),
                  );
                },
                child: Icon(Icons.file_present_rounded))
          ],
        ),
      ),
    );
  }
}
