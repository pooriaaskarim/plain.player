import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/routes/app.route_names.dart';
import '../../../infrastructure/utils/app.sizes.dart';

class PlainTabBar extends StatefulWidget {
  const PlainTabBar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  State<PlainTabBar> createState() => PlainTabBarState();
}

class PlainTabBarState extends State<PlainTabBar> {
  @override
  Widget build(final BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double tabHeight = AppSizes.size_56Pt;
    const double inactiveIconSize = AppSizes.size_32Pt;
    const double activeIconSize = AppSizes.size_24Pt;

    return SizedBox(
      width: screenWidth,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth - (1.5 * inactiveIconSize),
            child: TabBar(
              automaticIndicatorColorAdjustment: true,
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.tabController,
              dragStartBehavior: DragStartBehavior.start,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.play_circle_fill,
                    size: _isActive(0) ? activeIconSize : inactiveIconSize,
                  ),
                  height: tabHeight,
                  iconMargin: EdgeInsets.zero,
                  text: _isActive(0) ? 'Player' : null,
                  // height: _isActive(0) ? activeTabHeight : inactiveTabHeight,
                ),
                Tab(
                  icon: Icon(
                    Icons.folder,
                    size: _isActive(1) ? activeIconSize : inactiveIconSize,
                  ),
                  height: tabHeight,
                  iconMargin: EdgeInsets.zero,
                  text: _isActive(1) ? 'Folders' : null,
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.more_vert,
              size: inactiveIconSize,
            ),
            onSelected: (final value) {
              Navigator.of(context).pushNamed(value);
            },
            itemBuilder: (final context) => [
              PopupMenuItem<String>(
                value: AppRouteNames.settingsPage,
                child: const Text('Settings'),
              ),
              PopupMenuItem<String>(
                value: AppRouteNames.unknownPage,
                child: const Text('Unknown'),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool _isActive(final int currentIndex) =>
      widget.tabController.index == currentIndex;
}
