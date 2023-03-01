import 'package:equatable/equatable.dart';

abstract class MainPlayerEvent extends Equatable {
  const MainPlayerEvent();
  @override
  List<Object> get props => [];
}

class OnInit extends MainPlayerEvent {
  const OnInit();
}
