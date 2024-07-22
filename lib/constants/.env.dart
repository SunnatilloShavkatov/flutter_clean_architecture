import "dart:io";

import 'dart:io';

enum Environment { dev, prod }

abstract class AppConfig {
  String get baseUrl;

  String get apiToken;

  String get appName;
}

class DevEnvironment implements AppConfig {
  @override
  String get baseUrl => devBaseUrl;

  @override
  String get apiToken => devApiToken;

  @override
  String get appName => 'Englify Dev';
}

class ProdEnvironment implements AppConfig {
  @override
  String get baseUrl => prodBaseUrl;

  @override
  String get apiToken => prodApiToken;

  @override
  String get appName => 'Englify';
}

class AppEnvironment {
  static AppEnvironment get instance => _singleton;

  factory AppEnvironment() => _singleton;

  AppEnvironment._internal();

  static final AppEnvironment _singleton = AppEnvironment._internal();

  late AppConfig config;
  late Environment _currentEnv;

  void initEnvironment({required Environment env}) {
    config = _getConfig(env);
  }

  AppConfig _getConfig(Environment env) {
    _currentEnv = env;
    switch (env) {
      case Environment.prod:
        return ProdEnvironment();
      case Environment.dev:
        return DevEnvironment();
    }
  }

  Environment get currentEnv => _currentEnv;
}

/// prod
const String prodBaseUrl = "";
const String prodApiToken = "";

/// dev
const String devBaseUrl = "";
const String devApiToken = "";

///
///
