import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/locators.dart';
import 'package:news_app/services/interceptors/connectivity_retrier.dart';

class RetryInterceptor extends Interceptor {
  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      final response = getIt.get<ConnectivityRetrier>().scheduleRetry(
            err.requestOptions,
          );
      return handler.resolve(await response);
    }
  }

  bool _shouldRetry(DioError err) =>
      err.type == DioErrorType.other &&
      err.error != null &&
      err.error is SocketException;
}
