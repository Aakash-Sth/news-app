import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/api_service.dart';

import '../constants.dart';

class NewsService {
  ApiService apiService = ApiService();
  Future<List<NewsArticle>> getTopHeadlineNews() async {
    List<NewsArticle> news = [];

    final apiDatas = await apiService.getApiData(
        "${ApiConstants.baseUrl}/v2/top-headlines?country=us&apiKey=${ApiConstants.key}&pageSize=10");
    for (var apiData in apiDatas['articles']) {
      if (apiData['content'] != null || apiData['description'] != null) {
        NewsArticle article = NewsArticle.fromJson(apiData);
        news.add(article);
      }
    }

    return news;
  }

  Future<List<NewsArticle>> getMoreNews() async {
    List<NewsArticle> news = [];

    final apiDatas = await apiService.getApiData(
        "${ApiConstants.baseUrl}/v2/everything?q=keyword&apiKey=${ApiConstants.key}&pageSize=10");

    for (var apiData in apiDatas['articles']) {
      if (apiData['content'] != null || apiData['description'] != null) {
        NewsArticle article = NewsArticle.fromJson(apiData);
        news.add(article);
      }
    }

    return news;
  }
}
