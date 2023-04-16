import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../../domain/audio_library/model.folder.dart';
import '../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../../infrastructure/utils/app.utils.dart';
import '../../../../shared/widgets/widget.loading.dart';

class ScanFolderDialog extends material.StatefulWidget {
  const ScanFolderDialog({
    required this.folder,
    super.key,
  });

  final Folder folder;
  @override
  material.State<ScanFolderDialog> createState() => _ScanFolderDialogState();
  Future<void> showDialog(final material.BuildContext context) =>
      material.showDialog(
        context: context,
        builder: (final context) => ScanFolderDialog(folder: folder),
      );
}

class _ScanFolderDialogState extends material.State<ScanFolderDialog> {
  @override
  material.Widget build(final material.BuildContext context) {
    final size = material.MediaQuery.of(context).size.height / 3;

    return material.Center(
      child: material.Dialog(
        child: material.SizedBox(
          width: size,
          height: size,
          child: BlocConsumer<AudioLibraryCubit, AudioLibraryState>(
            bloc: BlocProvider.of<AudioLibraryCubit>(context),
            listener: (final _, final state) {
              if (state is DefaultState) {
                material.ScaffoldMessenger.of(context).showSnackBar(
                  const material.SnackBar(content: material.Text('Done')),
                );
                //todo: its probably best if this is handled from application layer
              }
            },
            builder: (final context, final state) => material.Column(
              mainAxisAlignment: material.MainAxisAlignment.center,
              mainAxisSize: material.MainAxisSize.max,
              children: [
                (state is ScanningState)
                    ? const Loading()
                    : material.TextButton(
                        child: const material.Text('Scan'),
                        onPressed: () async =>
                            BlocProvider.of<AudioLibraryCubit>(context)
                                .scanFolder(widget.folder),
                      ),
                AppUtils.verticalSpacer(size: AppSizes.points_32),
                (state is ScanningState)
                    ? material.StreamBuilder<String>(
                        stream: state.scanningStatus,
                        builder: (final context, final snapshot) =>
                            material.Text(
                          // '${state.scannedItems} / ${state.totalItems}',
                          snapshot.data ?? '',
                          textAlign: material.TextAlign.start,
                        ),
                      )
                    : AppUtils.emptyWidget,
                (state is ScanningState)
                    ? material.TextButton(
                        onPressed: () =>
                            BlocProvider.of<AudioLibraryCubit>(context).emit(
                          //todo handle in cubit
                          AudioLibraryState.defaultState(
                            folders: state.folders,
                            genres: state.genres,
                            artists: state.artists,
                            isScanning: false,
                          ),
                        ),
                        child: const material.Text('Cancel'),
                      )
                    : material.Row(
                        mainAxisAlignment: material.MainAxisAlignment.center,
                        children: [
                          material.TextButton(
                            onPressed: () =>
                                BlocProvider.of<AudioLibraryCubit>(context)
                                    .clearFolder(widget.folder),
                            child: const material.Text('Clear Folder'),
                          ),
                          material.TextButton(
                            onPressed: () =>
                                BlocProvider.of<AudioLibraryCubit>(context)
                                    .logFolder(widget.folder),
                            child: const material.Text('log Folder'),
                          ),
                          material.TextButton(
                            onPressed: () =>
                                material.Navigator.of(context).pop(),
                            child: const material.Text('Close'),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
