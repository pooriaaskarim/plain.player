import 'package:equatable/equatable.dart';

import '../../../domain/configuration/model.configurations.dart';
import '../../../domain/settings/model.settings.dart';

part 'state.app_launch.dart';
part 'state.default.dart';
part 'state.loading.dart';

abstract class PlainState extends Equatable {
  /// PlainBloc's State.
  const PlainState({
    required this.settings,
    this.configuration,
  });

  /// Returns [PlainState]:[AppLaunchState].
  /// Launches Plain app with a given [defaultSettings].
  factory PlainState.appLaunch({
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
  factory PlainState.loading({
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
