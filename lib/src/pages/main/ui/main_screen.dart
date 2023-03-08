import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_player_bloc.dart';
import 'widgets/main_screen_tab_bar.dart';
import 'widgets/main_screen_tab_bar_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    // _tabController.animateTo(2);
  }

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (final context) => MainPlayerBloc()),
        ],
        child: Scaffold(
          bottomNavigationBar: MainScreenTabBar(tabController: _tabController),
          body: MainScreenTabBarView(tabController: _tabController),
        ),
      );
}
