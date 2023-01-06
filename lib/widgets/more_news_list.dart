import 'package:flutter/material.dart';
import 'package:news_app/extensions/nav_extension.dart';

import '../models/news_article.dart';
import '../screens/news_screen.dart';
import 'more_news_item.dart';

class MoreNewsList extends StatelessWidget {
  final List<NewsArticle> moreNews;

  const MoreNewsList({required this.moreNews, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        NewsArticle article = moreNews[index];
        return GestureDetector(
          onTap: () {
            context.push(NewsScreen(article: article));
          },
          child: MoreNewsItem(article: article),
        );
      }, childCount: moreNews.length),
    );
  }
}
