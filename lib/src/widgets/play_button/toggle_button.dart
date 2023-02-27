import 'package:flutter/material.dart';

import 'models/playback_state.dart';

class ToggleButton extends StatefulWidget {
  final PlaybackState initState;
  final Function() notifyParent;
  const ToggleButton({
    required this.initState,
    Key? key,
    required this.notifyParent,
  }) : super(key: key);

  @override
  ToggleButtonState createState() => ToggleButtonState();
}

class ToggleButtonState extends State<ToggleButton>
    with SingleTickerProviderStateMixin {
//#region Button Properties
  late Color _buttonBGColor;
  late double _buttonSize;
  late ButtonStyle _buttonStyle;
  late double _buttonElevation;
  late PlaybackState _playbackState;
  PlaybackState get playbackState => _playbackState;
//#endregion

//#region Animation
  late final AnimationController _animationController;
  final Duration _animationDuration = const Duration(
    seconds: 1,
  );
//#endregion

  @override
  void initState() {
    _buttonSize = 100.0;
    _buttonElevation = 1;
    _playbackState = widget.initState;

    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      lowerBound: 0.3,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.preserve,
    )..forward();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _buttonBGColor = Theme.of(context).primaryColor;
    _buttonStyle = ButtonStyle(
      alignment: Alignment.center,
      animationDuration: Duration.zero,
      backgroundColor: MaterialStateProperty.all(_buttonBGColor),
      elevation: MaterialStateProperty.all(_buttonElevation),
      fixedSize: MaterialStateProperty.all(Size(_buttonSize, _buttonSize)),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(const CircleBorder()),
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => toggleButton();

  Widget toggleButton() {
    return ElevatedButton(
      onPressed: _onPressed,
      onLongPress: _onLongPress,
      style: _buttonStyle,
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: _animationController.value,
            child: child!,
          );
        },
        animation: _animationController,
        child: _playbackState.widget(context),
      ),
    );
  }

  void _onPressed() {
    setState(() {
      switch (_playbackState) {
        case (PlaybackState.play):
          _playbackState = PlaybackState.pause;
          break;
        case PlaybackState.pause:
          _playbackState = PlaybackState.play;
          break;
        case PlaybackState.stop:
          _playbackState = PlaybackState.play;
          break;
        case PlaybackState.loading:
          break;
        case PlaybackState.seeking:
          break;
        default:
          break;
      }
      _replayAnimation();
      widget.notifyParent();
    });
  }

  void _onLongPress() {
    setState(() {
      switch (_playbackState) {
        case (PlaybackState.play):
          _playbackState = PlaybackState.stop;
          break;
        case PlaybackState.pause:
          _playbackState = PlaybackState.stop;
          break;
        case PlaybackState.stop:
          _playbackState = PlaybackState.play;
          break;
        case PlaybackState.loading:
          break;
        case PlaybackState.seeking:
          break;
        default:
          break;
      }
      _replayAnimation();
      widget.notifyParent();
    });
  }

  void _replayAnimation() {
    _animationController
      ..reset()
      ..forward();
  }
}
