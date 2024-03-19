import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:breeds/src/core/utils/config/client_config.dart';
import 'package:breeds/src/core/utils/config/environment.dart';
import 'package:breeds/src/core/network/http_client.dart';
import 'package:breeds/src/core/utils/preferences.dart';

class App {
  static final instance = App._();

  final navigatorKey = GlobalKey<NavigatorState>();
  late Environment environment;

  Map<String, dynamic> config = {};
  String version = '';

  App._();

  Future<void> init({
    required Map<String, dynamic> config,
    required Environment environment,
  }) async {
    this.config = config;
    this.environment = environment;

    Intl.defaultLocale = 'es';

    XigoHttpClient.env = environment;
    await XigoHttpClient().initAsyncData();

    final prefs = Preferences();

    await prefs.init();
    prefs.isRefreshingToken = false;

    await _setPreferredOrientations();

    try {
      version = (await PackageInfo.fromPlatform()).version;
    } catch (_) {}
  }

  Future<void> _setPreferredOrientations() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<String> getIp() async {
    final app = Modular.get<AppConfig>();
    app.ip = await Ipify.ipv4();
    return app.ip;
  }

  Locale localeCallBack(Locale? locale, Iterable<Locale> supportedLocales) {
    if (locale == null) return supportedLocales.first;

    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.first;
  }
}
