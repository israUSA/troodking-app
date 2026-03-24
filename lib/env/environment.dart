import 'package:troodking_app/env/config/config_base.dart';
import 'package:troodking_app/env/config/config_dev.dart';
import 'package:troodking_app/env/config/config_prod.dart';

class Environment {
  static final Environment _environment = Environment._internal();

  factory Environment() => _environment;

  Environment._internal();

  static const String dev = 'DEV';
  static const String prod = 'PROD';
  static String versionApp = '1.1.7';

  BaseConfig? config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdEnv();
      default:
        return DevEnv();
    }
  }
}
