import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/routes/route_names.dart';
import '../../../../infrastructure/utils/app_utils.dart';

class MainPageTabBar extends StatefulWidget {
  const MainPageTabBar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  State<MainPageTabBar> createState() => MainPageTabBarState();
}

class MainPageTabBarState extends State<MainPageTabBar> {
  late int _activeTab;

  @override
  void initState() {
    super.initState();
    _activeTab = widget.tabController.index;
  }

  @override
  Widget build(final BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double activeTabHeight = AppUtils.xLargeSize;
    const double activeIconSize = activeTabHeight;
    const double inactiveTabHeight = AppUtils.largeSize;
    const double inactiveIconSize = inactiveTabHeight;

    return SizedBox(
      width: screenWidth,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth - (1.5 * activeIconSize),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              // onTap: (_) => updateActiveTab(),
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.tabController,
              dragStartBehavior: DragStartBehavior.start,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.play_circle_fill,
                    size: _isActive(0) ? activeIconSize : inactiveIconSize,
                  ),
                  height: _isActive(0) ? activeTabHeight : inactiveTabHeight,
                ),
                Tab(
                  icon: Icon(
                    Icons.folder,
                    size: _isActive(1) ? activeIconSize : inactiveIconSize,
                  ),
                  height: _isActive(1) ? activeTabHeight : inactiveTabHeight,
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.more_vert,
              size: activeIconSize,
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

  void updateActiveTab() => setState(() {
        _activeTab = widget.tabController.index;
      });
}
