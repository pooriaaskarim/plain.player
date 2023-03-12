import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main_page_bloc.dart';
import '../../../bloc/main_page_event.dart';
import '../../../bloc/main_page_state.dart';

class FoldersScreen extends StatelessWidget {
  const FoldersScreen({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) =>
            BlocProvider.of<MainPageBloc>(context)..add(const OnInit()),
        child: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (final context, final state) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final FilePickerResult? file = await FilePicker.platform
                      .pickFiles(allowMultiple: false, type: FileType.audio);
                  if (file != null) {
                    await BlocProvider.of<MainPageBloc>(context)
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
