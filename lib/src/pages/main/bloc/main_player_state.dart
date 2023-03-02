import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

abstract class MainPlayerState extends Equatable {
  const MainPlayerState({
    required this.audioPlayer,
  });
  final AudioPlayer audioPlayer;

  @override
  List<Object> get props => [
        audioPlayer,
      ];
}

class InitialState extends MainPlayerState {
  const InitialState({required super.audioPlayer});
}

class PlayState extends MainPlayerState {
  const PlayState({required super.audioPlayer});
}

class StopState extends MainPlayerState {
  const StopState({required super.audioPlayer});
}

class PauseState extends MainPlayerState {
  const PauseState({required super.audioPlayer});
}

class LoadingState extends MainPlayerState {
  const LoadingState({required super.audioPlayer});
}

class IdleState extends MainPlayerState {
  const IdleState({required super.audioPlayer});
}

class CompletedState extends MainPlayerState {
  const CompletedState({required super.audioPlayer});
}
