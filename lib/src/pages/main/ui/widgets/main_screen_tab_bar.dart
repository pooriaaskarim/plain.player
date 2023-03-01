import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/routes/route_names.dart';

class MainScreenTabBar extends StatelessWidget {
  const MainScreenTabBar({
    required final TabController tabController,
    super.key,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(final BuildContext context) => TabBar(
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.start,
        tabs: [
          const Tab(icon: Icon(Icons.playlist_play)),
          const Tab(icon: Icon(Icons.play_circle_fill)),
          const Tab(icon: Icon(Icons.file_present_rounded)),
          const Tab(icon: Icon(Icons.person)),
          const Tab(icon: Icon(Icons.disc_full)),
          PopupMenuButton(
            onSelected: (final _) => Navigator.pop(context),
            icon: const Icon(Icons.more_vert),
            itemBuilder: (final context) => [
              PopupMenuItem(
                child: MaterialButton(
                  child: const Text('Settings'),
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    AppRouteNames.settingsPage,
                  ),
                ),
              ),
              PopupMenuItem(
                child: MaterialButton(
                  child: const Text('Unknown'),
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    AppRouteNames.unknownPage,
                  ),
                ),
              ),
            ],
          )
        ],
      );
}
