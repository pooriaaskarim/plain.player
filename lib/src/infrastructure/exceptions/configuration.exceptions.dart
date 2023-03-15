import 'plain.exception.dart';

abstract class ConfigurationException<T> extends PlainException<T> {
  ConfigurationException(super.message);

  @override
  String get type => 'Configuration';
}

class AppNotConfiguredException extends ConfigurationException<String> {
  AppNotConfiguredException([super.message = 'App is not configured.']);
}
