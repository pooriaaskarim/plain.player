import 'plain.exception.dart';

abstract class StorageException<T> extends PlainException<T> {
  StorageException(super.message);

  @override
  String get type => 'Storage';
}
