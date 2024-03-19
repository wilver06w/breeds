import 'dart:convert';

/// A collection of utility functions for working with JSON Web Tokens (JWTs).
class Jwt {
  /// Returns the decoded payload of a JWT token.
  ///
  /// Throws a [FormatException] if the token is not in the expected format.
  /// Throws a [FormatException] if the payload is not a valid JSON object.
  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw const FormatException('Invalid token.');
    }

    final payload = decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw const FormatException('Invalid payload.');
    }

    return payloadMap;
  }

  /// Decodes a base64-encoded string.
  ///
  /// Throws an [Exception] if the input string is not a valid base64-encoded string.
  static String decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64 string.');
    }

    return utf8.decode(base64Url.decode(output));
  }

  /// Checks if a JWT token is expired.
  ///
  /// Returns `true` if the token is expired, `false` otherwise.
  /// Returns `false` if the input string is empty.
  static bool isExpired(String token) {
    try {
      if (token.isEmpty) {
        return false;
      }
      final DateTime? expirationDate = getExpiryDate(token);
      if (expirationDate != null) {
        return DateTime.now().isAfter(expirationDate);
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  /// Returns the expiry date of a JWT token.
  ///
  /// This function receives a JWT token as a `String` and returns the expiry
  /// date of the token as a `DateTime` object. If the token is malformed or
  /// missing the "exp" field, `null` will be returned instead.
  ///
  /// Example:
  ///
  /// ```dart
  /// String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
  ///
  /// DateTime? expiryDate = Jwt.getExpiryDate(token);
  ///
  /// if (expiryDate != null) {
  ///   print('Token expires at: ${expiryDate.toIso8601String()}');
  /// } else {
  ///   print('Token is missing "exp" field or is malformed.');
  /// }
  /// ```
  static DateTime? getExpiryDate(String token) {
    try {
      final Map<String, dynamic> payload = parseJwt(token);
      if (payload['exp'] != null) {
        return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true)
            .add(Duration(seconds: payload['exp']));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// This function does not validate the contents of the `typ` field in the header.
  static bool? isJwt(String token) {
    final Map<String, dynamic> header = getHeader(token);
    if (header['typ'] != null) {
      return header['typ'] == 'JWT';
    }
    return false;
  }

  static Map<String, dynamic> getHeader(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw const FormatException('Invalid token.');
    }

    final header = decodeBase64(parts[0]);
    final headerMap = json.decode(header);
    if (headerMap is! Map<String, dynamic>) {
      throw const FormatException('Invalid header.');
    }

    return headerMap;
  }

  static bool hasNParts({required String token, int n = 3}) {
    final parts = token.split('.');
    return parts.length == n ? true : false;
  }
}
