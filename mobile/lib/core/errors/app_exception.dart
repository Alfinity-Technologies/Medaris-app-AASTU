import 'package:dio/dio.dart';

class AppException implements Exception {
  const AppException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  static AppException fromDioException(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const AppException(
        'The request timed out. Please try again.',
      ),
      DioExceptionType.connectionError => const AppException(
        'Unable to connect. Check your internet connection and try again.',
      ),
      DioExceptionType.badResponse => AppException(
        'The service returned an error. Please try again later.',
        statusCode: exception.response?.statusCode,
      ),
      DioExceptionType.cancel => const AppException(
        'The request was canceled.',
      ),
      _ => const AppException('Something went wrong. Please try again.'),
    };
  }

  @override
  String toString() => message;
}
