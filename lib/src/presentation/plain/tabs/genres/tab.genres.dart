import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../domain/audio_library/model.genre.dart';
import '../../../shared/widgets/widget.loading.dart';
import '../../screen.plain.dart';
import '../i.plain.tab.dart';

class GenresTab extends PlainTab {
  const GenresTab({required super.key});

  @override
  PlainTabState<PlainTab> createState() => GenresTabState();
}

class GenresTabState extends PlainTabState<GenresTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AudioLibraryCubit>(context).loadGenres();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);

    return BlocBuilder<AudioLibraryCubit, AudioLibraryState>(
      builder: (final _, final state) {
        final List<Genre>? genres = state.genres;
        final bool isLoadingGenres = state.isLoadingGenres;
        return isLoadingGenres
            ? Center(
                child: Loading(),
              )
            : (genres != null && genres.isNotEmpty)
                ? ListView.builder(
                    itemCount: state.genres!.length,
                    itemBuilder: (final context, final index) => TextButton(
                      onPressed: () {},
                      child: Text(state.genres![index].genre),
                    ),
                  )
                : const Center(child: Text('No Genres Found!'));
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
