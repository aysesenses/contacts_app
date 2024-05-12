import 'package:contacts_app/product/init/config/app_configuration.dart';
import 'package:contacts_app/product/init/config/dev_env.dart';
import 'package:contacts_app/product/init/config/prod_env.dart';
import 'package:flutter/foundation.dart';

/// Application environment manager class
class AppEnvironment {
  /// General application environment setup
  AppEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }
  static late final AppConfiguration _config;
}

/// Get application environment items
enum AppEnvironmentItems {
  /// Network base url
  baseUrl,

  /// Network api key
  apiKey;

  /// Get application environment item value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialized.');
    }
  }
}
