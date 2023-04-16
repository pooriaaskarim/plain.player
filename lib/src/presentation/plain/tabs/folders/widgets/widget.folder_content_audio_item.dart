import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../infrastructure/config/theme/app.opacities.dart';
import '../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../../infrastructure/utils/extensions/extension.filesystem_entity.is_audio.dart';
import '../../../../shared/widgets/widget.scrolling_text.dart';

class FolderContentAudioItem extends StatelessWidget {
  FolderContentAudioItem({
    required this.audio,
    required this.onTap,
    super.key,
  }) : assert(audio.isAudio, 'Only audio files are supported.');

  final FileSystemEntity audio;
  final void Function() onTap;

  IconData get itemIcon {
    if (audio.isSupportedAudio) {
      return Icons.audio_file;
    } else {
      return Icons.warning;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            );
    final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (final states) {
          if (states.any(
            {
              MaterialState.disabled,
            }.contains,
          )) {
            return Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(AppOpacities.disabledStateLayerOpacity);
          }
          if (states.any(
            {
              MaterialState.hovered,
            }.contains,
          )) {
            return Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(AppOpacities.hoverStateLayerOpacity);
          }
          if (states.any(
            {
              MaterialState.focused,
            }.contains,
          )) {
            return Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(AppOpacities.focusStateLayerOpacity);
          }
          if (states.any(
            {
              MaterialState.pressed,
            }.contains,
          )) {
            return Theme.of(context)
                .colorScheme
                .primary
                .withOpacity(AppOpacities.pressStateLayerOpacity);
          }
          //default: enabled state
          return Theme.of(context)
              .colorScheme
              .tertiaryContainer
              .withOpacity(.9);
        },
      ),
      shape: MaterialStateProperty.all(
        const ContinuousRectangleBorder(),
      ),
      side: MaterialStateProperty.all(
        BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
      ),
    );
    final Color iconColor =
        Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(.8);
    return ElevatedButton(
      onPressed: onTap,
      style: buttonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            itemIcon,
            opticalSize: AppSizes.points_32,
            size: AppSizes.points_32,
            color: iconColor,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (final context, final constraints) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      AppSizes.points_4,
                    ),
                    child: ScrollingText(
                      text: audio.path.split('/').last,
                      textStyle: textStyle!,
                      maxLines: 2,
                      size: Size(
                        constraints.maxWidth,
                        constraints.maxHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
