import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

abstract class MainPlayerState extends Equatable {
  const MainPlayerState({
    required this.audiPlayer,
  });
  final AudioPlayer audiPlayer;

  @override
  List<Object> get props => [
        audiPlayer,
      ];
}

class InitialState extends MainPlayerState {
  const InitialState({required super.audiPlayer});
}

class PlayState extends MainPlayerState {
  const PlayState({required super.audiPlayer});
}

class StopState extends MainPlayerState {
  const StopState({required super.audiPlayer});
}

class PauseState extends MainPlayerState {
  const PauseState({required super.audiPlayer});
}

class LoadingState extends MainPlayerState {
  const LoadingState({required super.audiPlayer});
}

class IdleState extends MainPlayerState {
  const IdleState({required super.audiPlayer});
}

class CompletedState extends MainPlayerState {
  const CompletedState({required super.audiPlayer});
}
