import 'package:equatable/equatable.dart';

import '../../domain/settings/settings.model.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({required this.settings});
  factory SettingsState.defaultState({
    required final Settings settings,
  }) =>
      DefaultState._(settings: settings);

  final Settings settings;
  @override
  List<Object?> get props => [
        settings,
      ];
}

class DefaultState extends SettingsState {
  const DefaultState._({required super.settings});
  @override
  List<Object?> get props => [
        settings,
      ];
}

//Todo
// class SavingState extends SettingsState {
//   const SavingState._({required super.settings});
//   @override
//   List<Object?> get props => [
//         settings,
//       ];
// }
