import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  factory SplashEvent.loadSettings() => const OnLoadSettings._();
  factory SplashEvent.writeDefaultSettings() =>
      const OnWriteDefaultSettings._();
  factory SplashEvent.loadConfigurations() => const OnLoadConfigurations._();
  factory SplashEvent.onSuccess() => const OnSuccess._();
  factory SplashEvent.onError({required final String errorMessage}) =>
      OnError._(errorMessage: errorMessage);

  @override
  List<Object?> get props => [];
}

class OnLoadSettings extends SplashEvent {
  const OnLoadSettings._();
}

class OnWriteDefaultSettings extends SplashEvent {
  const OnWriteDefaultSettings._();
}

class OnLoadConfigurations extends SplashEvent {
  const OnLoadConfigurations._();
}

class OnSuccess extends SplashEvent {
  const OnSuccess._();
}

class OnError extends SplashEvent {
  const OnError._({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
