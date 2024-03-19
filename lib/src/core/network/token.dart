import 'package:breeds/src/shared/models/token.dart';
import 'package:breeds/src/core/network/http_client.dart';
import 'package:breeds/src/core/network/jwt.dart';
import 'package:breeds/src/core/utils/preferences.dart';

class TokenRepository {
  bool isTokenExpired(Token? msToken) {
    try {
      var isExpired = Jwt.isExpired(msToken?.accessToken ?? '');
      return isExpired;
    } catch (_) {
      return true;
    }
  }

  Future<Token?> refreshToken({
    bool withNewDio = false,
    required Preferences prefs,
    required XigoHttpClient httpClient,
  }) async {
    try {
      if (prefs.isRefreshingToken) {
        return Future.value();
      }
      if (prefs.msToken != null) {
        Token? newToken;
        prefs.isRefreshingToken = true;
        final haveUuid =
            haveDeviceUuidInPayload(prefs.msToken?.accessToken ?? '');
        newToken = await _refreshJwtToken(
          refreshToken: prefs.msToken?.accessToken ?? '',
          withNewDio: withNewDio,
          haveUuid: haveUuid,
          httpClient: httpClient,
        );
        prefs.isRefreshingToken = false;
        prefs.msToken = newToken;

        httpClient.updateHeadersWithToken(newToken);
      }
    } catch (_) {
      prefs.isRefreshingToken = false;
      if (prefs.msToken?.accessToken != null) {
        httpClient.updateHeadersWithToken(prefs.msToken!);
      }
    }
    return prefs.msToken;
  }

  Future<Token> _refreshJwtToken({
    required String refreshToken,
    bool withNewDio = false,
    bool haveUuid = false,
    required XigoHttpClient httpClient,
  }) async {
    try {
      httpClient.msDio.options.extra.addAll({'showMessage': false});

      Dio dioToken =
          withNewDio ? Dio(httpClient.msDio.options) : httpClient.msDio;

      final response = await dioToken.post(
        '/refresh-token',
        data: {
          'token': refreshToken,
        },
      );

      return Token.fromJson(response.data);
    } catch (_) {
      rethrow;
    } finally {
      httpClient.msDio.options.extra.remove('showMessage');
    }
  }

  //verifico si en el payload del Token tiene el device_uuid
  bool haveDeviceUuidInPayload(String token) {
    bool haveUuid = false;
    if (token.isEmpty) {
      return false;
    }
    try {
      final map = Jwt.parseJwt(token);
      final String uuid = (map['device_uuid'] ?? '');
      if (uuid.isNotEmpty) {
        haveUuid = true;
      }
    } catch (_) {}
    return haveUuid;
  }
}
