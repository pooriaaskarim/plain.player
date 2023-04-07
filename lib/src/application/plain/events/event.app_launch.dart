part of 'event.plain.dart';

class OnAppLaunch extends PlainEvent {
  const OnAppLaunch._({
    required this.defaultSettings,
  });
  final Settings defaultSettings;
  @override
  List<Object> get props => [
        defaultSettings,
      ];
}
