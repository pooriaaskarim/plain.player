import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../application/plain/bloc.plain.dart';
import '../../../../infrastructure/utils/app.sizes.dart';
import '../../../../infrastructure/utils/app.utils.dart';
import '../i.plain.tab.dart';
import 'widgets/plain_button/widget.plain_button.dart';
import 'widgets/seeking_bar/widget.seeking_bar.dart';

class PlayerTab extends PlainTab {
  const PlayerTab({
    required this.audioPlayer,
    required super.key,
  });
  final AudioPlayer audioPlayer;

  @override
  PlainTabState<PlayerTab> createState() => PlayerTabState();
}

class PlayerTabState extends PlainTabState<PlayerTab> {
  int _willPopCount = 0;

  @override
  Widget build(final BuildContext context) {
    super.build(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SeekingBarWidget(audioPlayer: widget.audioPlayer),
        AppUtils.verticalSpacer(size: AppSizes.points_24),
        PlainButtonWidget(
          audioPlayer: widget.audioPlayer,
        ),
        AppUtils.verticalSpacer(size: AppSizes.points_40),
      ],
    );
  }

  @override
  FloatingActionButton? get floatingActionButton => FloatingActionButton(
        highlightElevation: 6,
        onPressed: () async {
          final TextEditingController tc = TextEditingController();
          final plainBloc = BlocProvider.of<PlainBloc>(context);
          await showDialog(
            context: context,
            builder: (final context) => Dialog(
              child: SizedBox(
                width: 100,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Enter valid URL',
                        ),
                        controller: tc,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await plainBloc.audioPlayer.setUrl(tc.text);
                      },
                      child: const Text('Open'),
                    ),
                  ],
                ),
              ),
            ),
          );
          // final FilePickerResult? file = await FilePicker.platform.pickFiles(
          //   allowMultiple: false,
          //   type: FileType.audio,
          // );
          // if (file != null) {
          //   await plainBloc.audioPlayer.setUrl(file.files.first.path!);
          // }
        },
        child: const Icon(
          Icons.audiotrack,
        ),
      );
  // @override
  // FloatingActionButton? get floatingActionButton => FloatingActionButton(
  //       highlightElevation: 6,
  //       onPressed: () async {
  //         final plainBloc = BlocProvider.of<PlainBloc>(context);
  //         final FilePickerResult? file = await FilePicker.platform.pickFiles(
  //           allowMultiple: false,
  //           type: FileType.audio,
  //         );
  //         if (file != null) {
  //           await plainBloc.audioPlayer.setUrl(file.files.first.path!);
  //         }
  //       },
  //       child: const Icon(
  //         Icons.audiotrack,
  //       ),
  //     );

  @override
  AppBar? get appBar => null;

  @override
  Future<bool> get onWillPop async {
    _willPopCount++;
    if (_willPopCount == 2) {
      return true;
    }
    await ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Press back again to close app.',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        )
        .closed
        .then((final value) => _willPopCount = 0);
    return false;
  }

  @override
  bool get wantKeepAlive => true;
}
