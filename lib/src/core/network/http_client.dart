import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:breeds/src/shared/models/token.dart';
import 'package:breeds/src/core/utils/config/client_config.dart';
import 'package:breeds/src/core/utils/config/environment.dart';
import 'package:breeds/src/core/network/dio.dart';
import 'package:breeds/src/core/network/http_client.dart';
import 'package:breeds/src/core/network/interceptors/disabled_interceptor.dart';
import 'package:breeds/src/core/network/interceptors/errors_interceptor.dart';
import 'package:breeds/src/core/network/interceptors/retry_interceptor.dart';
import 'package:breeds/src/core/network/jwt.dart';
import 'package:breeds/src/core/network/token.dart';
import 'package:breeds/src/core/utils/preferences.dart';
import 'package:breeds/generated/l10n.dart';

export 'package:dio/dio.dart';
export 'package:flutter_modular/flutter_modular.dart';

class XigoHttpClient {
  XigoHttpClient._();
  static final _singleton = XigoHttpClient._();

  factory XigoHttpClient() => _singleton;

  static Environment env = Environment.dev;
  late XigoSharedDio _msDio;

  late String _deviceVersion;
  late String _appVersion;
  late String _userAgent;

  Dio get msDio => _msDio.dio;
  XigoSharedDio get xigoSharedDio => _msDio;

  Future<void> initAsyncData() async {
    _singleton._deviceVersion = await _getDeviceVersion();
    _singleton._appVersion = await _getAppVersion();
    _singleton._userAgent = await _getUserAgent();
  }

  XigoHttpClient getInstance(AppConfig config) {
    _singleton._msDio = XigoSharedDio(
      baseUrl: config.country.api!,
      appName: 'app-conductor',
      interceptors: [
        ErrorsInterceptor(Modular.get()),
        XigoRetryInterceptor(
          prefs: Modular.get<Preferences>(),
          httpClient: _singleton,
          tokenRepository: TokenRepository(),
        ),
        DisabledUserInterceptor(
          onDisabledUser: () {
            Modular.to.pushNamedAndRemoveUntil(
              '/auth/status/blocked',
              (_) => false,
            );
          },
        ),
      ],
      appVersion: _singleton._appVersion,
      countryCode: config.country.locale?.countryCode ?? '',
      langCode: config.country.locale?.languageCode ?? '',
      os: _getOsName(),
      userAgent: _singleton._userAgent,
      transactionId: _getTransactionId(),
      deviceVersion: _singleton._deviceVersion,
      enableLogs: env != Environment.prod,
    );

    S.load(
      Locale(
        config.country.locale!.languageCode!,
        config.country.locale!.countryCode!,
      ),
    );

    _addToken();
    _addHeaderXsource();
    return _singleton;
  }

  void _addToken() {
    final prefs = Modular.get<Preferences>();
    if (prefs.msToken?.accessToken != null) {
      updateHeadersWithToken(prefs.msToken!);
    }
    _addDeviceUuid(prefs.msToken?.accessToken ?? '');
  }

  void _addDeviceUuid(String token) {
    final uuid = deviceUuid(token);
    if (uuid.isNotEmpty) {
      updateDeviceHeaders(uuid);
    }
  }

  void updateDeviceHeaders(String deviceUuid) {
    final headers = {
      'device-uuid': deviceUuid,
      'X-Device-Uuid': deviceUuid,
    };
    _msDio.addHeaders(headers);
  }

  void updateHeadersWithToken(Token token) {
    _msDio.addHeaders({
      HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}',
    });
    _addDeviceUuid(token.accessToken ?? '');
  }

  String _getOsName() {
    return Platform.isIOS ? 'ios' : 'android';
  }

  String _getTransactionId() {
    final prefs = Modular.get<Preferences>();
    return prefs.traceId;
  }

  Future<String> _getDeviceVersion() async {
    final deviceOSversion = Platform.isIOS
        ? (await DeviceInfoPlugin().iosInfo).systemVersion
        : (await DeviceInfoPlugin().androidInfo).version.release;
    return deviceOSversion;
  }

  Future<String> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> _getUserAgent() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final dartFullVersion = Platform.version;
    final dartShortVersion = dartFullVersion.split(' ')[0];
    final os = _getOsName();
    final deviceOSversion = await _getDeviceVersion();
    return 'Dart/$dartShortVersion - XigoConductor/${packageInfo.version} - OS/$os - Version/$deviceOSversion';
  }

  void _addHeaderXsource() {
    const source = String.fromEnvironment('x-source');
    if (source.isNotEmpty) {
      _msDio.addHeaders({
        "X-source": source,
      });
    }
  }

  //verifico si en el payload del Token tiene el device_uuid
  String deviceUuid(String token) {
    String deviceUuid = '';
    if (token.isEmpty) {
      return deviceUuid;
    }
    try {
      final map = Jwt.parseJwt(token);
      final String uuid = (map['device_uuid'] ?? '');
      if (uuid.isNotEmpty) {
        deviceUuid = uuid;
      }
    } catch (_) {}
    return deviceUuid;
  }
}
