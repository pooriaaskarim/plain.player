import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'i.repository.dart';

abstract class LocalRepository implements IRepository {
  const LocalRepository._();
  @protected
  bool get isOpen;
  @protected
  external final String instanceName;
  @protected
  external final List<CollectionSchema> schemasList;
  @protected
  Future<Isar> get openDb;

  Future<void> get dismissDb;
}
