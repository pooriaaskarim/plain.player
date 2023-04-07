import 'package:equatable/equatable.dart';

import '../../../domain/settings/model.settings.dart';

part 'state.default.dart';

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

//Todo
// class SavingState extends SettingsState {
//   const SavingState._({required super.settings});
//   @override
//   List<Object?> get props => [
//         settings,
//       ];
// }
