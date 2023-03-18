import 'package:isar/isar.dart';

part 'model.configurations.g.dart';

@Collection()
class Configurations {
  const Configurations();
  final Id id = Isar.autoIncrement;
}
