import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/plain/bloc.plain.dart';
import '../tabs/folders/tab.folders.dart';
import '../tabs/i.plain.tab.dart';
import '../tabs/player/tab.player.dart';

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
        children: tabViewList(context),
      );

  List<PlainTab> tabViewList(final BuildContext context) => [
        PlayerTab(
          audioPlayer: BlocProvider.of<PlainBloc>(context).audioPlayer,
        ),
        const FoldersTab(),
        // SizedBox.shrink(),
      ];
}
