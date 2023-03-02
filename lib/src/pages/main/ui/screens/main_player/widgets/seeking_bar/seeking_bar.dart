import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'widgets/custom_thumb_shape.dart';
import 'widgets/custom_track_shape.dart';

class SeekingBar extends StatefulWidget {
  const SeekingBar({
    required this.audioPlayer,
    this.activeTrackHeight = 120.0,
    this.inactiveTrackHeight = 1.0,
    super.key,
  });
  final AudioPlayer audioPlayer;
  final double activeTrackHeight;
  final double inactiveTrackHeight;

  @override
  State<SeekingBar> createState() => _SeekingBarState();
}

class _SeekingBarState extends State<SeekingBar> with TickerProviderStateMixin {
  final Duration minDuration = Duration.zero;
  bool isTouched = false;
  double? sliderTouchedPosition;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) =>
      StreamBuilder<Map<String, Duration?>>(
        stream: Rx.combineLatest2<Duration, Duration, Map<String, Duration?>>(
          widget.audioPlayer.positionStream,
          widget.audioPlayer.bufferedPositionStream,
          (final a, final b) => {
            'position': a,
            'bufferPosition': b,
          },
        ),
        builder: (final context, final positionsMapSnapshot) {
          _debugPrintAudioPlayerDetails(widget.audioPlayer);

          return SliderTheme(
            data: _getSliderTheme(
              context: context,
              hasBuffer: hasBuffer,
              isTouched: isTouched,
              min: minDuration.inMicroseconds.toDouble(),
              max: widget.audioPlayer.duration?.inMicroseconds.toDouble() ?? 0,
              secondaryValue: positionsMapSnapshot
                  .data?['bufferPosition']?.inMicroseconds
                  .toDouble(),
            ),
            child: Slider(
              min: 0.0,
              max:
                  widget.audioPlayer.duration?.inMicroseconds.toDouble() ?? 0.0,
              onChangeStart: (final value) {
                isTouched = true;
              },
              onChangeEnd: (final value) {
                isTouched = false;
                sliderTouchedPosition = null;
                widget.audioPlayer.seek(Duration(microseconds: value.toInt()));
              },
              onChanged: isActive
                  ? (final value) {
                      setState(() {
                        sliderTouchedPosition = value;
                      });
                    }
                  : null,
              value: sliderTouchedPosition ??
                  positionsMapSnapshot.data?['position']?.inMicroseconds
                      .toDouble() ??
                  0.0,
            ),
          );
        },
      );

  void _debugPrintAudioPlayerDetails(
    final AudioPlayer audioPlayer,
  ) {
    debugPrint('''
    
    
     -----------------------------------------
     Duration: ${widget.audioPlayer.duration}
     Position: ${widget.audioPlayer.position}
     BufferedPosition: ${widget.audioPlayer.bufferedPosition}
     ProcessingState: ${widget.audioPlayer.processingState}
     Events: ${widget.audioPlayer.playbackEvent}
     ------------------------------------------
     
     
     ''');
  }

  bool get hasBuffer =>
      !isTouched && widget.audioPlayer.bufferedPosition.inSeconds != 0;
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
    required final bool hasBuffer,
    required final double max,
    required final double min,
    final double? secondaryValue,
  }) =>
      SliderThemeData(
        activeTrackColor: Theme.of(context).colorScheme.primary,
        disabledActiveTrackColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
        secondaryActiveTrackColor: Theme.of(context).colorScheme.tertiary,
        inactiveTrackColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        trackShape: CustomTrackShape(
          hasBuffer: hasBuffer,
          secondaryValue: secondaryValue,
          min: min,
          max: max,
        ),
        overlayShape: SliderComponentShape.noOverlay,
        trackHeight:
            isActive ? widget.activeTrackHeight : widget.inactiveTrackHeight,
        thumbShape: CustomThumbShape(
          parentContext: context,
          isTouched: isTouched,
          min: min,
          max: max,
        ),
      );
}
