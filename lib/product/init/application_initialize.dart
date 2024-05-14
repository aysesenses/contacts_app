import 'dart:async';

import 'package:contacts_app/product/init/config/app_environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';

@immutable

/// This class is used to initialize the application process
class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        debugPrint('ApplicationInitialize Error : $error');
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      debugPrint(details.exceptionAsString());
    };

    AppEnvironment.general();
  }
}
