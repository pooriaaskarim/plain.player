import 'package:equatable/equatable.dart';

abstract class PlainState extends Equatable {
  const PlainState();

  @override
  List<Object> get props => [];
}

class InitialState extends PlainState {
  const InitialState();
}

class FoldersState extends PlainState {
  const FoldersState();
}

class PlayersState extends PlainState {
  const PlayersState();
}
