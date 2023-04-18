import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../domain/audio_library/model.artist.dart';
import '../../../shared/widgets/widget.loading.dart';
import '../../screen.plain.dart';
import '../i.plain.tab.dart';

class ArtistsTab extends PlainTab {
  const ArtistsTab({required super.key});

  @override
  PlainTabState<PlainTab> createState() => ArtistsTabState();
}

class ArtistsTabState extends PlainTabState<ArtistsTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AudioLibraryCubit>(context).loadArtists();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);

    return BlocBuilder<AudioLibraryCubit, AudioLibraryState>(
      builder: (final _, final state) {
        final List<Artist>? artists = state.artists;
        final bool isLoadingArtists = state.isLoadingArtists;
        return isLoadingArtists
            ? const Center(
                child: Loading(),
              )
            : (artists != null && artists.isNotEmpty)
                ? ListView.builder(
                    itemCount: state.artists?.length,
                    itemBuilder: (final context, final index) => TextButton(
                      onPressed: () {},
                      child: Text(state.artists![index].name),
                    ),
                  )
                : const Center(child: Text('No Artists Found!'));
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
