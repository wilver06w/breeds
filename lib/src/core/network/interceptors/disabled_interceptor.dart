import 'package:dio/dio.dart';

class DisabledUserInterceptor extends Interceptor {
  final void Function() onDisabledUser;
  DisabledUserInterceptor({
    required this.onDisabledUser,
  });

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response != null && err.response?.statusCode == 403) {
      onDisabledUser();
      return super.onError(err, handler);
    }

    return super.onError(err, handler);
  }
}
