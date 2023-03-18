import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../domain/configuration/model.configurations.dart';
import 'i.repository.local.dart';

class ConfigurationsRepository implements LocalRepository {
  const ConfigurationsRepository();
  @override
  @protected
  bool get isOpen => Isar.instanceNames.contains(instanceName);
  @override
  @protected
  final String instanceName = 'ConfigurationRepository';
  @override
  @protected
  final List<CollectionSchema> schemasList = const [ConfigurationsSchema];

  @override
  @protected
  Future<Isar> get openDb async => isOpen
      ? Future.value(Isar.getInstance(instanceName))
      : Isar.open(
          [...schemasList],
          name: instanceName,
          inspector: true,
        );

  @override
  Future<void> get dismissDb async {
    if (isOpen) {
      await (await openDb).close();
    }
  }
}
