import 'package:equatable/equatable.dart';

abstract class PlainEvent extends Equatable {
  const PlainEvent();
  @override
  List<Object> get props => [];
}

class OnInit extends PlainEvent {
  const OnInit();
}
