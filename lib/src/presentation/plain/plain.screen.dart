import 'package:flutter/material.dart';

import 'widgets/plain.tab_bar.dart';
import 'widgets/plain.tab_bar_view.dart';

class PlainScreen extends StatefulWidget {
  const PlainScreen({super.key});

  @override
  State<PlainScreen> createState() => _PlainScreenState();
}

class _PlainScreenState extends State<PlainScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  GlobalKey<PlainTabBarState> tabBarKey = GlobalKey<PlainTabBarState>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        tabBarKey.currentState?.setState(() {});
      });
    // _tabController.animateTo(2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        bottomNavigationBar: PlainTabBar(
          key: tabBarKey,
          tabController: _tabController,
        ),
        body: PlainTabBarView(tabController: _tabController),
      );
}
