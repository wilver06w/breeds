import 'dart:async';
import 'dart:io';
import 'package:flutter/scheduler.dart';
import 'package:breeds/src/core/utils/config/client_config.dart';
import 'package:breeds/src/core/network/http_client.dart';
import 'package:breeds/src/core/network/jwt.dart';
import 'package:breeds/src/core/network/token.dart';
import 'package:breeds/src/core/utils/preferences.dart';

class XigoRetryInterceptor extends Interceptor {
  final Preferences prefs;
  final XigoHttpClient httpClient;

  final TokenRepository tokenRepository;

  XigoRetryInterceptor({
    required this.prefs,
    required this.httpClient,
    required this.tokenRepository,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final XigoRetryOptions retryOptions =
        options.extra.containsKey(XigoRetryOptions.extraKey)
            ? XigoRetryOptions.fromExtra(options)
            : const XigoRetryOptions(retries: 0);

    if (prefs.isLogged) {
      bool isTokenCorrupted = false;
      isTokenCorrupted =
          !Jwt.hasNParts(token: prefs.msToken?.accessToken ?? '');

      bool isRefreshTokenExpired =
          Jwt.isExpired(prefs.msToken?.accessToken ?? '');

      if (isTokenCorrupted || isRefreshTokenExpired) {
        final app = Modular.get<AppConfig>();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          app.logout();
        });
      }

      if (tokenRepository.isTokenExpired(prefs.msToken) ||
          retryOptions.isUnauthorized) {
        final rToken = await tokenRepository.refreshToken(
          withNewDio: true,
          prefs: prefs,
          httpClient: httpClient,
        );

        if (rToken?.accessToken != null) {
          options.headers[HttpHeaders.authorizationHeader] =
              'Bearer ${rToken!.accessToken}';
        }

        handler.next(options);

        return;
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    const options = XigoRetryOptions(retries: 3);

    if (!err.requestOptions.extra.containsKey(XigoRetryOptions.extraKey)) {
      err.requestOptions.extra.addAll(options.toExtra());
    }

    void next(resp) {
      if (resp is Response) {
        handler.resolve(resp);
      } else {
        handler.next(err);
      }
    }

    if (options.retryEvaluator(err)) {
      final retries = XigoRetryOptions.fromExtra(err.requestOptions).retries;
      await Future.delayed(options.retryInterval);

      final retryOptions = options.copyWith(
        retries: retries - 1,
        isUnauthorized: err.response?.statusCode == 401,
      );

      err.requestOptions.extra = retryOptions.toExtra();

      final resp = await retryRequest(err);

      next(resp);
      return;
    }

    return super.onError(err, handler);
  }

  Future<dynamic> retryRequest(DioException err) async {
    final dio = Modular.get<XigoHttpClient>().msDio;

    try {
      return await dio.request(
        err.requestOptions.path,
        cancelToken: err.requestOptions.cancelToken,
        data: err.requestOptions.data,
        onReceiveProgress: err.requestOptions.onReceiveProgress,
        onSendProgress: err.requestOptions.onSendProgress,
        queryParameters: err.requestOptions.queryParameters,
        options: Options(
          extra: err.requestOptions.extra,
          contentType: err.requestOptions.contentType,
          followRedirects: err.requestOptions.followRedirects,
          headers: err.requestOptions.headers,
          listFormat: err.requestOptions.listFormat,
          maxRedirects: err.requestOptions.maxRedirects,
          method: err.requestOptions.method,
          receiveDataWhenStatusError:
              err.requestOptions.receiveDataWhenStatusError,
          receiveTimeout: err.requestOptions.receiveTimeout,
          requestEncoder: err.requestOptions.requestEncoder,
          responseDecoder: err.requestOptions.responseDecoder,
          responseType: err.requestOptions.responseType,
          sendTimeout: err.requestOptions.sendTimeout,
          validateStatus: err.requestOptions.validateStatus,
        ),
      );
    } catch (e) {
      return e;
    }
  }
}

class XigoRetryOptions {
  final int retries;
  final bool isRefreshing;
  final bool isUnauthorized;

  const XigoRetryOptions({
    required this.retries,
    this.isRefreshing = true,
    this.isUnauthorized = false,
  });

  final retryInterval = const Duration(milliseconds: 1500);
  static const extraKey = 'retry_request';

  bool retryEvaluator(DioException err) {
    final statusCode = (err.response?.statusCode ?? 0);
    final leftRetries = XigoRetryOptions.fromExtra(err.requestOptions).retries;

    return (statusCode > 500 || statusCode == 401) && leftRetries > 0;
  }

  factory XigoRetryOptions.fromExtra(RequestOptions request) {
    return request.extra[extraKey];
  }

  XigoRetryOptions copyWith({
    int? retries,
    bool? isRefreshing,
    bool? isUnauthorized,
  }) {
    return XigoRetryOptions(
      retries: retries ?? this.retries,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isUnauthorized: isUnauthorized ?? this.isUnauthorized,
    );
  }

  Map<String, dynamic> toExtra() {
    return {extraKey: this};
  }
}
