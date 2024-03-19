import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

/// XigoSharedDio
///
/// Xigo shared dio
///
/// Made by Xigoteam
///
/// This class will help us to manage every dio http request to our Xigo
/// api exposed
///
/// By defualt
class XigoSharedDio {
  XigoSharedDio({
    /// only for test, this value for test should be a mock
    Dio? dioInstance,
    required String baseUrl,
    required this.appName,
    List<Interceptor> interceptors = const [],
    this.appVersion = '',
    this.countryCode = '',
    this.langCode = '',
    this.os = '',
    this.userAgent = '',
    this.transactionId = '',
    this.deviceVersion = '',
    this.deviceUuid = '',
    this.aditionalHeaders = const {},
    this.enableLogs = true,
  }) {
    _dioInstance = dioInstance ?? Dio()
      ..options.baseUrl = baseUrl
      ..options.followRedirects = false
      ..interceptors.addAll(interceptors);
    _addHeaders();
    _addCacheInterceptor();
    _addRetryInterceptor();
    _addLogInterceptor();
  }

  late Dio _dioInstance;

  /// This property is a value in Http request headers.
  ///
  /// `X-App-Name`
  String appName;

  /// This property is a value in Http request headers.
  ///
  /// `X-App-Version`
  String appVersion;

  /// This property is a value in Http request headers.
  ///
  /// `X-Country`
  String countryCode;

  /// This property is a value in Http request headers.
  ///
  /// `X-Lang`
  String langCode;

  /// This property is a value in Http request headers.
  ///
  /// `os`
  String os;

  /// This property is a value in Http request headers.
  ///
  /// `User-Agent`
  String userAgent;

  /// This property is a value in Http request headers.
  ///
  /// `X-Device-Version`
  String deviceVersion;

  /// This property is a value in Http request headers.
  ///
  /// `X-Transaction-ID`
  String transactionId;

  /// This property is a value in Http request headers.
  ///
  /// `X-Device-Uuid`
  String deviceUuid;

  /// It's used to add new headers, by default all Xigo api necesary headers
  /// was added, but if you need to add another one, you can
  /// By default this property is a empty `Map<String, String>`
  ///
  Map<String, dynamic> aditionalHeaders;

  /// This property is a value in Http request headers.
  ///

  /// This property if is true should add LogInterceptor in
  /// the interceptor list .
  ///
  ///  ```dart
  ///   LogInterceptor(
  ///      requestBody: true,
  ///      responseBody: true,
  ///    )
  ///  ```
  bool enableLogs;

  Dio get dio => _dioInstance;

  ///This method add new headers to `Http request headers`
  ///
  /// Be careful because this class does not remove headers after they are added
  void addHeaders(Map<String, dynamic> headers) {
    _dioInstance.options.headers.addAll(headers);
  }

  /// This method update an `Http request headers` value
  ///
  /// if  an `Http request headers` value whit the key does not exist, the
  /// methods will return
  void updateHeader(String key, String value) {
    Map<String, dynamic>? header = _dioInstance.options.headers[key];

    if (header == null) return;

    _dioInstance.options.headers[key] = value;
  }

  void _addCacheInterceptor() {
    CacheOptions cacheOptions = CacheOptions(
      store: MemCacheStore(),
    );

    _dioInstance.interceptors.add(
      DioCacheInterceptor(options: cacheOptions),
    );
  }

  void _addRetryInterceptor() {
    _dioInstance.interceptors.add(
      RetryInterceptor(
        dio: _dioInstance,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
    );
  }

  void _addHeaders() {
    _dioInstance.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      HttpHeaders.acceptEncodingHeader: 'gzip',
      'os': os,
      'App-name': appName,
      'App-version': appVersion,
      'User-Agent': userAgent,
      'device-uuid': deviceUuid,
      'X-App-Name': appName,
      'X-Country': countryCode,
      'X-Lang': langCode,
      'X-App-Version': appVersion,
      'X-Device-Version': deviceVersion,
      'X-Transaction-ID': transactionId,
      'X-Device-Uuid': deviceUuid,
      ...aditionalHeaders
    };
  }

  void _addLogInterceptor() {
    if (!enableLogs) return;

    _dioInstance.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  void removeHeader(String header) {
    _dioInstance.options.headers.remove(header);
  }
}
