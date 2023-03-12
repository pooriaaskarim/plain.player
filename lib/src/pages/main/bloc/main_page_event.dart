import 'package:equatable/equatable.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();
  @override
  List<Object> get props => [];
}

class OnInit extends MainPageEvent {
  const OnInit();
}
