import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {
  const MainPageState();

  @override
  List<Object> get props => [];
}

class InitialState extends MainPageState {
  const InitialState();
}

class FoldersState extends MainPageState {
  const FoldersState();
}

class PlayersState extends MainPageState {
  const PlayersState();
}
