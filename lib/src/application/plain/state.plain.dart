import 'package:equatable/equatable.dart';

import '../../domain/configuration/model.configurations.dart';
import '../../domain/settings/model.settings.dart';

abstract class PlainState extends Equatable {
  /// PlainBloc's State.
  const PlainState({
    required this.settings,
    this.configuration,
  });

  /// Returns [PlainState]:[AppLaunchState].
  /// Launches Plain app with a given [defaultSettings].
  factory PlainState.appLaunchState({
    required final Settings defaultSettings,
  }) =>
      AppLaunchState._(defaultSettings: defaultSettings);

  /// Returns [PlainState]:[DefaultState].
  /// *** the state of Plain app running normally
  factory PlainState.defaultState({
    required final Settings settings,
    final Configurations? configuration,
  }) =>
      DefaultState._(
        settings: settings,
        configuration: configuration,
      );

  /// Returns [PlainState]:[LoadingState].
  factory PlainState.loadingState({
    required final Settings settings,
    final Configurations? configuration,
  }) =>
      LoadingState._(
        settings: settings,
        configuration: configuration,
      );

  /// Plain app requires a [Settings] object.
  /// *** should default to [Settings] object
  /// when launching the app with [AppLaunchState].
  final Settings settings;

  /// Plain app [Configurations] object: sets playlists, player position, etc.
  final Configurations? configuration;

  @override
  List<Object?> get props => [
        settings,
        configuration,
      ];
}

class AppLaunchState extends PlainState {
  /// Plain's Launch State.
  const AppLaunchState._({
    required final Settings defaultSettings,
  }) : super(settings: defaultSettings);
}

class DefaultState extends PlainState {
  /// Plain's Default State.
  const DefaultState._({
    required super.settings,
    super.configuration,
  });
}

class LoadingState extends PlainState {
  /// Plain's Loading State.
  const LoadingState._({
    required super.settings,
    super.configuration,
  });
}
