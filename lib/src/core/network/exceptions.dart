import 'package:equatable/equatable.dart';

/// Exception occur when server failure
class ServerException extends Equatable implements Exception {
  final String message;
  final int? statusCode;

  const ServerException(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];

}

/// Exception occur when call api over on time
class CancelTokenException implements Exception {
  final String message;
  final int? statusCode;

  CancelTokenException(this.message, this.statusCode);
}
