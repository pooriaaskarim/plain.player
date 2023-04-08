import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  bool _showFAB = true;
  bool _hasFAB = true;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        tabBarKey.currentState?.setState(() {});
        _hasFAB = plainTabBarView
                .tabViewList(context)[_tabController.index]
                .floatingActionButton(context) !=
            null;
        _showFAB = true;
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
  Widget build(final BuildContext context) {
    const Duration animationDuration = Duration(milliseconds: 300);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness:
            (Theme.of(context).brightness == Brightness.light)
                ? Brightness.dark
                : Brightness.light,
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        bottomNavigationBar: plainTabBar,
        body: _getBody(),
        floatingActionButton:
            _getFloatingActionButton(animationDuration, context),
      ),
    );
  }

  AnimatedSlide? _getFloatingActionButton(
    final Duration animationDuration,
    final BuildContext context,
  ) =>
      _hasFAB
          ? AnimatedSlide(
              duration: animationDuration,
              offset: _showFAB ? Offset.zero : const Offset(0, 0.5),
              child: AnimatedOpacity(
                duration: animationDuration,
                opacity: _showFAB ? 1 : 0,
                child: plainTabBarView
                    .tabViewList(context)[_tabController.index]
                    .floatingActionButton(context),
              ),
            )
          : null;

  Widget _getBody() => _hasFAB
      ? NotificationListener<UserScrollNotification>(
          onNotification: (final notification) {
            final ScrollDirection direction = notification.direction;
            setState(() {
              if (direction == ScrollDirection.reverse) {
                _showFAB = false;
              } else if (direction == ScrollDirection.forward) {
                _showFAB = true;
              }
            });
            return true;
          },
          child: plainTabBarView,
        )
      : plainTabBarView;
}
