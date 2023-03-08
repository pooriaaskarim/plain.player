import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_player_bloc.dart';
import '../../bloc/main_player_state.dart';
import '../screens/plain_player/plain_player.dart';

class MainScreenTabBarView extends StatelessWidget {
  const MainScreenTabBarView({
    required final TabController tabController,
    super.key,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(final BuildContext context) => TabBarView(
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.start,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   color: Colors.blue,
          // ),
          BlocConsumer<MainPlayerBloc, MainPlayerState>(
            listener: (final context, final state) {},
            builder: (final context, final state) => const PlainPlayer(),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   color: Colors.amber,
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   color: Colors.white,
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   color: Colors.pink,
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   color: Colors.black,
          // ),
          const SizedBox.shrink(),
        ],
      );
}
