part of 'event.plain.dart';

class OnLoadConfigurations extends PlainEvent {
  const OnLoadConfigurations._({
    this.dismissDatabase = false,
  });
  final bool dismissDatabase;
  @override
  List<Object?> get props => [
        dismissDatabase,
      ];
}
