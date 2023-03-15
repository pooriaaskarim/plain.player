abstract class PlainException<T> implements Exception {
  const PlainException(this.message);
  final T message;
  String get type;

  @override
  String toString() => 'Plain.$type.Exception:\n\t$message';
}
