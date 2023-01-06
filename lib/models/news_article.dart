import 'package:equatable/equatable.dart';

class NewsArticle extends Equatable {
  final String? imageUrl;
  final String title;
  final DateTime publishedDate;
  final String? description;
  final String? content;
  final String newsUrl;
  const NewsArticle(
      {required this.newsUrl,
      required this.imageUrl,
      required this.title,
      required this.publishedDate,
      required this.content,
      required this.description});

  NewsArticle.fromJson(Map<String, dynamic> json)
      : imageUrl = json['urlToImage'],
        title = json['title'],
        publishedDate = DateTime.parse(json['publishedAt']),
        description = json['description'],
        content = json['content'],
        newsUrl = json['url'];

  @override
  List<Object?> get props =>
      [imageUrl, title, publishedDate, description, content, newsUrl];
}
