import 'package:bloc_mvu_app/config/config_update.dart';
import 'package:bloc_mvu_app/mvu/update.dart';

const String dev = 'DEV';
const String stage = 'STAGE';
const String prod = 'PROD';

class ConfigModel {
  ConfigModel({required this.environment});

  factory ConfigModel.dev() => ConfigModel(environment: dev);

  factory ConfigModel.stage() => ConfigModel(environment: stage);

  factory ConfigModel.prod() => ConfigModel(environment: prod);

  factory ConfigModel.createUsingSystemEnvironment() {
    const appEnv = String.fromEnvironment('APP_ENV', defaultValue: dev);
    switch (appEnv) {
      case dev:
        return ConfigModel.dev();
      case stage:
        return ConfigModel.stage();
      case prod:
        return ConfigModel.prod();
      default:
        return ConfigModel.dev();
    }
  }

  final String environment;

  static ConfigModel get() {
    final configUpdate = updateByType[ConfigUpdate];

    if (configUpdate != null && configUpdate is ConfigUpdate) {
      return configUpdate.model();
    }

    throw Exception(
        'This app can not work without an instance of ConfigUpdate!');
  }
}
