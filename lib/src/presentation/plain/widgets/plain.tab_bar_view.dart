import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/plain/plain.bloc.dart';
import '../tabs/folders/folders.dart';
import '../tabs/player/player.dart';

class PlainTabBarView extends StatelessWidget {
  const PlainTabBarView({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(final BuildContext context) => TabBarView(
        controller: tabController,
        dragStartBehavior: DragStartBehavior.start,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Player(
            audioPlayer: BlocProvider.of<PlainBloc>(context).audioPlayer,
          ),
          const FoldersTab(),
          // SizedBox.shrink(),
        ],
      );
}
