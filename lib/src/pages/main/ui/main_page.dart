import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../bloc/main_page_bloc.dart';
import 'widgets/main_screen_tab_bar.dart';
import 'widgets/main_screen_tab_bar_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;
  GlobalKey<MainPageTabBarState> tabBarKey = GlobalKey<MainPageTabBarState>();
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
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => MainPageBloc(
          audioPlayer: AudioPlayer(),
          tabController: _tabController,
        ),
        child: Scaffold(
          bottomNavigationBar: MainPageTabBar(
            key: tabBarKey,
            tabController: _tabController,
          ),
          body: MainPageTabBarView(tabController: _tabController),
        ),
      );
}
