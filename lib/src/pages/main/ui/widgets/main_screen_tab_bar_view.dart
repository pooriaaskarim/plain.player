import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_page_bloc.dart';
import '../screens/folders/folders_screen.dart';
import '../screens/player/player.dart';

class MainPageTabBarView extends StatelessWidget {
  const MainPageTabBarView({
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
            audioPlayer: BlocProvider.of<MainPageBloc>(context).audioPlayer,
          ),
          const FoldersScreen(),
          // SizedBox.shrink(),
        ],
      );
}
