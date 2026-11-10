import 'package:dio/dio.dart';

import '../errors/app_exception.dart';

class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final appException = AppException.fromDioException(err);
    handler.next(
      err.copyWith(error: appException, message: appException.message),
    );
  }
}
