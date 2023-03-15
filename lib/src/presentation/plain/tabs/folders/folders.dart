import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/plain/plain.bloc.dart';
import '../../../../application/plain/plain.event.dart';
import '../../../../application/plain/plain.state.dart';

class FoldersTab extends StatelessWidget {
  const FoldersTab({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) =>
            BlocProvider.of<PlainBloc>(context)..add(const OnInit()),
        child: BlocBuilder<PlainBloc, PlainState>(
          builder: (final context, final state) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final FilePickerResult? file = await FilePicker.platform
                      .pickFiles(allowMultiple: false, type: FileType.audio);
                  if (file != null) {
                    await BlocProvider.of<PlainBloc>(context)
                        .audioPlayer
                        .setUrl(file.files.first.path!);
                  }
                },
                child: const Icon(Icons.file_present_rounded),
              )
            ],
          ),
        ),
      );
}
