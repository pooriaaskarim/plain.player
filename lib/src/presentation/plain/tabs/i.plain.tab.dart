import 'package:flutter/material.dart';

abstract class PlainTab extends StatefulWidget {
  const PlainTab({
    required this.key,
  }) : super(key: key);
  @override
  final GlobalKey<PlainTabState> key;

  @override
  PlainTabState createState();
}

abstract class PlainTabState<T extends PlainTab> extends State<T>
    with AutomaticKeepAliveClientMixin {
  Widget? get floatingActionButton;
  Future<bool> get onWillPop;
  AppBar? get appBar;
}
