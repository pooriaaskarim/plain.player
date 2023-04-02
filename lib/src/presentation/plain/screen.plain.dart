import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/widget.plain.tab_bar_view.dart';
import 'widgets/widget.plain_tab_bar.dart';

class PlainScreen extends StatefulWidget {
  const PlainScreen({super.key});

  @override
  State<PlainScreen> createState() => _PlainScreenState();
}

class _PlainScreenState extends State<PlainScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  GlobalKey<PlainTabBarState> tabBarKey = GlobalKey<PlainTabBarState>();
  late PlainTabBarView plainTabBarView;
  late PlainTabBar plainTabBar;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        tabBarKey.currentState?.setState(() {});
        setState(() {});
      });
    plainTabBarView = PlainTabBarView(tabController: _tabController);
    plainTabBar = PlainTabBar(
      key: tabBarKey,
      tabController: _tabController,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) =>
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness:
              (Theme.of(context).brightness == Brightness.light)
                  ? Brightness.dark
                  : Brightness.light,
          statusBarBrightness: Theme.of(context).brightness,
        ),
        child: Scaffold(
          bottomNavigationBar: plainTabBar,
          body: plainTabBarView,
          floatingActionButton: plainTabBarView
              .tabViewList(context)[_tabController.index]
              .floatingActionButton(context),
        ),
      );
}
