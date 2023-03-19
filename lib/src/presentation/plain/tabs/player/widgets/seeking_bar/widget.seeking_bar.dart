import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'widgets/custom_thumb_shape.dart';
import 'widgets/custom_track_shape.dart';

class SeekingBarWidget extends StatefulWidget {
  const SeekingBarWidget({
    required this.audioPlayer,
    this.activeTrackHeight = 120.0,
    this.inactiveTrackHeight = 1.0,
    super.key,
  });
  final AudioPlayer audioPlayer;
  final double activeTrackHeight;
  final double inactiveTrackHeight;

  @override
  State<SeekingBarWidget> createState() => _SeekingBarWidgetState();
}

class _SeekingBarWidgetState extends State<SeekingBarWidget> {
  bool _isTouched = false;
  double? _sliderTouchedPosition;
  @override
  void initState() {
    super.initState();
  }

  bool get hasBuffer =>
      !_isTouched && widget.audioPlayer.bufferedPosition.inSeconds != 0;

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
    required final double min,
    final double? max,
    final double? secondaryValue,
  }) =>
      SliderThemeData(
        activeTrackColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.7),
        disabledActiveTrackColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
        inactiveTrackColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        overlayShape: SliderComponentShape.noOverlay,
        secondaryActiveTrackColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
        thumbColor: Theme.of(context).colorScheme.inversePrimary,
        thumbShape: CustomThumbShape(
          isTouched: isTouched,
          min: min,
          max: max,
        ),
        trackHeight:
            isActive ? widget.activeTrackHeight : widget.inactiveTrackHeight,
        trackShape: CustomTrackShape(
          hasBuffer: hasBuffer,
          secondaryValue: secondaryValue,
          min: min,
          max: max,
        ),
        valueIndicatorTextStyle: Theme.of(context).textTheme.labelLarge,
      );

  @override
  Widget build(final BuildContext context) {
    const Duration minDuration = Duration.zero;

    return StreamBuilder<Map<String, Duration?>>(
      stream: Rx.combineLatest2<Duration, Duration, Map<String, Duration?>>(
        widget.audioPlayer.positionStream,
        widget.audioPlayer.bufferedPositionStream,
        (final position, final duration) => {
          'position': position,
          'bufferPosition': duration,
        },
      ),
      builder: (final context, final positionsMapSnapshot) => Column(
        children: [
          SliderTheme(
            data: _getSliderTheme(
              context: context,
              hasBuffer: hasBuffer,
              isTouched: _isTouched,
              min: minDuration.inMicroseconds.toDouble(),
              max: widget.audioPlayer.duration?.inMicroseconds.toDouble(),
              secondaryValue: positionsMapSnapshot
                  .data?['bufferPosition']?.inMicroseconds
                  .toDouble(),
            ),
            child: Slider(
              min: minDuration.inMicroseconds.toDouble(),
              max:
                  widget.audioPlayer.duration?.inMicroseconds.toDouble() ?? 0.0,
              onChangeStart: (final value) {
                _isTouched = true;
              },
              onChangeEnd: (final value) {
                _isTouched = false;
                _sliderTouchedPosition = null;
                widget.audioPlayer.seek(Duration(microseconds: value.toInt()));
              },
              onChanged: isActive
                  ? (final value) =>
                      setState(() => _sliderTouchedPosition = value)
                  : null,
              value: _sliderTouchedPosition ??
                  positionsMapSnapshot.data?['position']?.inMicroseconds
                      .toDouble() ??
                  0.0,
            ),
          ),
        ],
      ),
    );
  }
}
