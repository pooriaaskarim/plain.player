part of 'event.plain.dart';

class OnLoadSettings extends PlainEvent {
  const OnLoadSettings._fromDb({
    required this.scaffoldMessengerState,
    this.dismissDatabase = false,
    this.settings,
  }) : assert(
          scaffoldMessengerState != null,
          'When using fromObject, scaffoldMessengerState cannot be null.',
        );
  const OnLoadSettings._fromObject({
    required this.settings,
    this.scaffoldMessengerState,
    this.dismissDatabase,
  }) : assert(
          settings != null,
          'When using fromObject, settings cannot be null.',
        );
  final Settings? settings;
  final ScaffoldMessengerState? scaffoldMessengerState;
  final bool? dismissDatabase;
  @override
  List<Object?> get props => [
        scaffoldMessengerState,
        dismissDatabase,
      ];
}
