import 'dart:async';

import 'package:flutter/material.dart';

import '../../../infrastructure/utils/app.utils.dart';

class ScrollingText extends StatefulWidget {
  const ScrollingText({
    required this.text,
    required this.textStyle,
    required this.size,
    this.maxLines = 1,
    this.repeatCount = 2,
    super.key,
  })  : assert(maxLines > 0, 'maxLines must be greater than 0'),
        assert(repeatCount > 0, 'repeatCount must be greater than 0');
  final String text;
  final TextStyle textStyle;
  final Size size;
  final int maxLines;
  final int repeatCount;

  @override
  State<ScrollingText> createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText> {
  late int _availableCharacters;
  late int _currentPosition;
  late int _scrollCount;
  late bool _isScrolling;
  final Duration _scrollInterval = const Duration(milliseconds: 250);
  bool get _fitsHorizontalSpace => _availableCharacters >= widget.text.length;
  @override
  void initState() {
    super.initState();
    _availableCharacters =
        widget.size.width ~/ (widget.textStyle.fontSize! / 1.8);
    _currentPosition = 0;
    _scrollCount = 0;
    _isScrolling = false;
    if (!_fitsHorizontalSpace) {
      WidgetsBinding.instance.addPostFrameCallback((final callback) {
        startScrolling();
      });
    }
  }

  Future<void> startScrolling() async {
    _isScrolling = true;
    await Future.delayed(_scrollInterval, () async {
      if (_currentPosition == 0 && _scrollCount != 0) {
        await AppUtils.fakeDelay();
      }
      if (_currentPosition + _availableCharacters < widget.text.length) {
        _currentPosition++;
      } else {
        _currentPosition = 0;
        await AppUtils.fakeDelay();
        _scrollCount++;
      }
      if (mounted) {
        setState(() {});
      }
      if (_scrollCount == widget.repeatCount) {
        _scrollCount = 0;
        _isScrolling = false;
        return;
      } else {
        await startScrolling();
      }
    });
  }

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: widget.size.width,
        child: _fitsHorizontalSpace
            ? Text(
                widget.text,
                style: widget.textStyle,
                overflow: TextOverflow.visible,
                softWrap: true,
                maxLines: widget.maxLines,
              )
            : GestureDetector(
                onLongPressEnd: (final _) async {
                  if (!_isScrolling) {
                    await startScrolling();
                  }
                },
                child: Text(
                  widget.text.substring(
                    _currentPosition,
                    _currentPosition + _availableCharacters,
                  ),
                  style: widget.textStyle,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  maxLines: widget.maxLines,
                ),
              ),
      );
}
