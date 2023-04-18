import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../domain/audio_library/model.album.dart';
import '../../../shared/widgets/widget.loading.dart';
import '../../screen.plain.dart';
import '../i.plain.tab.dart';

class AlbumsTab extends PlainTab {
  const AlbumsTab({required super.key});

  @override
  PlainTabState<PlainTab> createState() => AlbumsTabState();
}

class AlbumsTabState extends PlainTabState<AlbumsTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AudioLibraryCubit>(context).loadAlbums();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);

    return BlocBuilder<AudioLibraryCubit, AudioLibraryState>(
      builder: (final _, final state) {
        final List<Album>? albums = state.albums;
        final bool isLoadingAlbums = state.isLoadingAlbums;
        return isLoadingAlbums
            ? const Center(
                child: Loading(),
              )
            : (albums != null && albums.isNotEmpty)
                ? ListView.builder(
                    itemCount: state.albums?.length,
                    itemBuilder: (final context, final index) => TextButton(
                      onPressed: () {},
                      child: Text(state.albums![index].name),
                    ),
                  )
                : const Center(child: Text('No Albums Found!'));
      },
    );
  }

  @override
  AppBar? get appBar => null;

  @override
  Widget? get floatingActionButton => null;

  @override
  Future<bool> get onWillPop async {
    PlainScreen.of(context).tabController.animateTo(0);
    return false;
  }

  @override
  bool get wantKeepAlive => false;
}
