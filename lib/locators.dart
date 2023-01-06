import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/services/interceptors/connectivity_retrier.dart';

final getIt = GetIt.instance;

void setupLocators() {
  getIt.registerLazySingleton<Dio>(
    () {
      Dio dio = Dio();
      return dio;
    },
  );
  getIt.registerFactory<ConnectivityRetrier>(
    () => ConnectivityRetrier(),
  );
  getIt.registerFactory<Connectivity>(
    () => Connectivity(),
  );
}
