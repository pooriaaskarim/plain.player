import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/plain/bloc.plain.dart';
import 'tabs/albums/tab.albums.dart';
import 'tabs/artists/tab.artists.dart';
import 'tabs/folders/tab.folders.dart';
import 'tabs/genres/tab.genres.dart';
import 'tabs/i.plain.tab.dart';
import 'tabs/player/tab.player.dart';
import 'widgets/widget.plain_tab_bar.dart';

class PlainScreen extends StatefulWidget {
  const PlainScreen({super.key});
  static PlainScreenState of(final BuildContext context) {
    assert(
      context.findAncestorWidgetOfExactType<PlainScreen>() != null,
      'Could not find a PlainScreen Element in the context widget tree.',
    );

    final PlainScreenData data =
        context.dependOnInheritedWidgetOfExactType<PlainScreenData>()!;
    return data.state;
  }

  @override
  State<PlainScreen> createState() => PlainScreenState();
}

class PlainScreenState extends State<PlainScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  final GlobalKey<AlbumsTabState> _albumsTabKey = GlobalKey<AlbumsTabState>();
  final GlobalKey<ArtistsTabState> _artistsTabKey =
      GlobalKey<ArtistsTabState>();
  final GlobalKey<FoldersTabState> _foldersTabKey =
      GlobalKey<FoldersTabState>();
  final GlobalKey<GenresTabState> _genresTabKey = GlobalKey<GenresTabState>();
  final GlobalKey<PlayerTabState> _playerTabKey = GlobalKey<PlayerTabState>();
  late List<PlainTab> _tabViewList;
  late PlainTabBar _plainTabBar;
  final GlobalKey<PlainTabBarState> _tabBarKey = GlobalKey<PlainTabBarState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        _tabBarKey.currentState?.setState(() {});

        setState(() {});
      });
    _tabViewList = [
      PlayerTab(
        key: _playerTabKey,
        audioPlayer: BlocProvider.of<PlainBloc>(context).audioPlayer,
      ),
      FoldersTab(
        key: _foldersTabKey,
      ),
      AlbumsTab(key: _albumsTabKey),
      ArtistsTab(key: _artistsTabKey),
      GenresTab(key: _genresTabKey),
    ];
    _plainTabBar = PlainTabBar(
      key: _tabBarKey,
      tabController: tabController,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => PlainScreenData(
        state: this,
        child: WillPopScope(
          onWillPop: () =>
              _tabViewList[tabController.index].key.currentState!.onWillPop,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarIconBrightness:
                  (Theme.of(context).brightness == Brightness.light)
                      ? Brightness.dark
                      : Brightness.light,
              statusBarBrightness: Theme.of(context).brightness,
            ),
            child: Scaffold(
              appBar: getAppBar,
              bottomNavigationBar: _plainTabBar,
              body: TabBarView(
                controller: tabController,
                dragStartBehavior: DragStartBehavior.start,
                physics: const NeverScrollableScrollPhysics(),
                children: _tabViewList,
              ),
              floatingActionButton: getFAB,
            ),
          ),
        ),
      );

  Widget? get getFAB =>
      _tabViewList[tabController.index].key.currentState?.floatingActionButton;

  AppBar? get getAppBar =>
      _tabViewList[tabController.index].key.currentState?.appBar;
}

class PlainScreenData extends InheritedWidget {
  const PlainScreenData({
    required super.child,
    required this.state,
    super.key,
  });

  final PlainScreenState state;
  @override
  bool updateShouldNotify(covariant final InheritedWidget oldWidget) =>
      state.tabController.indexIsChanging;
}
