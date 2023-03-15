import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../application/plain/plain.bloc.dart';
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
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => PlainBloc(
          audioPlayer: AudioPlayer(),
          tabController: _tabController,
        ),
        child: Scaffold(
          bottomNavigationBar: PlainTabBar(
            key: tabBarKey,
            tabController: _tabController,
          ),
          body: PlainTabBarView(tabController: _tabController),
        ),
      );
}
