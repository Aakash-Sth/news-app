import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:news_app/locators.dart';

class ConnectivityRetrier {
  final connectivity = getIt.get<Connectivity>();
  final dio = getIt.get<Dio>();
  Stream<dynamic> stream =
      Stream.periodic(const Duration(seconds: 1), (i) => i * i).take(2);

  Future<Response> scheduleRetry(RequestOptions requestOptions) async {
    final respCompleter = Completer<Response>();
    StreamSubscription subscription = stream.listen(null);

    subscription = connectivity.onConnectivityChanged.listen(
      (connResult) {
        if (connResult == ConnectivityResult.wifi ||
            connResult == ConnectivityResult.mobile) {
          subscription.cancel();

          respCompleter.complete(
            dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              onSendProgress: requestOptions.onSendProgress,
              options: Options(
                method: requestOptions.method,
                contentType: requestOptions.contentType,
                sendTimeout: requestOptions.sendTimeout,
              ),
              queryParameters: requestOptions.queryParameters,
            ),
          );
        }
      },
    );
    return respCompleter.future;
  }
}
