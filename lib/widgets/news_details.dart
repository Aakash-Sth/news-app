import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_article.dart';

class NewsDetails extends StatelessWidget {
  final NewsArticle article;
  const NewsDetails({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    String? content = article.content ?? article.description;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 15),
          child: Column(
            children: [
              Text(
                article.title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "\n${DateFormat('MMM d, yyyy').format(article.publishedDate)}\n\n$content}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
