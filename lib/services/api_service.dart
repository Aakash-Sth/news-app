import 'package:dio/dio.dart';
import 'package:news_app/locators.dart';

class ApiService {
  Future<dynamic> getApiData(String url) async {
    final response = await getIt.get<Dio>().get(url);
    return response.data;
  }
}
