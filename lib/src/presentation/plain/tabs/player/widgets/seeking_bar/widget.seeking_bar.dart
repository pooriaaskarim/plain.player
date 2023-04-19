import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../../../infrastructure/utils/extensions/extension.just_audio.dart';
import 'widgets/custom_thumb_shape.dart';
import 'widgets/custom_track_shape.dart';

class SeekingBarWidget extends StatefulWidget {
  const SeekingBarWidget({
    required this.audioPlayer,
    super.key,
  });
  final AudioPlayer audioPlayer;

  @override
  State<SeekingBarWidget> createState() => _SeekingBarWidgetState();
}

class _SeekingBarWidgetState extends State<SeekingBarWidget> {
  bool _isTouched = false;
  double? _sliderTouchedPosition;
  final double _activeTrackHeight = 120;
  final double _inactiveTrackHeight = 1;

  bool get hasBuffer => !_isTouched && widget.audioPlayer.hasBuffer;

  bool get isActive {
    switch (widget.audioPlayer.processingState) {
      case ProcessingState.ready:
      case ProcessingState.buffering:
        return true;
      case ProcessingState.idle:
      case ProcessingState.loading:
      case ProcessingState.completed:
        return false;
    }
  }

  SliderThemeData _getSliderTheme({
    required final BuildContext context,
    required final bool isTouched,
  }) =>
      SliderThemeData(
        activeTrackColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.7),
        disabledActiveTrackColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.7),
        inactiveTrackColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        overlayShape: SliderComponentShape.noOverlay,
        secondaryActiveTrackColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
        thumbColor: Theme.of(context).colorScheme.inversePrimary,
        thumbShape: CustomThumbShape(
          isTouched: isTouched,
        ),
        trackHeight: _activeTrackHeight,
        trackShape: CustomTrackShape(
          activeTrackHeight: _activeTrackHeight,
          inactiveTrackHeight: _inactiveTrackHeight,
        ),
        valueIndicatorTextStyle: Theme.of(context).textTheme.labelLarge,
      );

  @override
  Widget build(final BuildContext context) {
    final double minPosition = Duration.zero.inMicroseconds.toDouble();

    final sliderTheme = _getSliderTheme(
      context: context,
      isTouched: _isTouched,
    );
    return StreamBuilder<Map<String, Duration?>>(
      stream: Rx.combineLatest2<Duration, Duration?, Map<String, Duration?>>(
        widget.audioPlayer.positionStream,
        widget.audioPlayer.bufferedPositionStream,
        (final position, final bufferPosition) => {
          'position': position,
          'bufferPosition': hasBuffer ? bufferPosition : null,
        },
      ),
      builder: (final context, final positionsMapSnapshot) {
        // AppUtils.debugPrintAudioPlayerDetails(widget.audioPlayer);
        final double? duration =
            widget.audioPlayer.duration?.inMicroseconds.toDouble();
        final double? position =
            positionsMapSnapshot.data?['position']!.inMicroseconds.toDouble();
        final double? bufferPosition = positionsMapSnapshot
            .data?['bufferPosition']?.inMicroseconds
            .toDouble();

        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            SliderTheme(
              data: sliderTheme,
              child: Slider(
                label: _isTouched
                    ? _getPositionAsTimeString(_sliderTouchedPosition)
                    : '',
                secondaryTrackValue: (duration != null) ? bufferPosition : null,
                min: minPosition,
                max: duration ?? 1,
                onChangeStart: (final value) {
                  setState(() {
                    _isTouched = true;
                  });
                },
                onChangeEnd: (final value) {
                  setState(() {
                    _isTouched = false;
                    _sliderTouchedPosition = null;
                  });
                  widget.audioPlayer
                      .seek(Duration(microseconds: value.toInt()));
                },
                onChanged: isActive
                    ? (final value) =>
                        setState(() => _sliderTouchedPosition = value)
                    : null,
                value: _sliderTouchedPosition ??
                    min(
                      position ?? 0,
                      duration ?? 0,
                    ),
                // a bug in Just_Audio causes position to be
                // greater than duration, this min() is a
                // temporary [hopefully!] fix
              ),
            ),
            if (isActive)
              Padding(
                padding: const EdgeInsets.all(AppSizes.points_8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${_getPositionAsTimeString(position)}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '${_getPositionAsTimeString(duration)}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  String? _getPositionAsTimeString(
    final double? position,
  ) {
    String? buffer;
    if (position != null) {
      final Duration positionTime = Duration(microseconds: position.round());
      //Get position time string as HH:MM:SS
      buffer = positionTime.toString().split('.').first.padLeft(8, '0');
      //Cut out HH int HH:MM:SS if doesn't exceed an hour
      if (buffer.split(':').first == '00') {
        buffer = buffer.substring(3, 8);
      }
    }
    return buffer;
  }
}
