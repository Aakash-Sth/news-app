import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';

import '../theme/sizes.dart';
import 'custom_image.dart';

class MoreNewsItem extends StatelessWidget {
  final NewsArticle article;
  const MoreNewsItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, left: 35, right: 30),
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            width: 85,
            height: 50,
            child: CustomImage(
              imageUrl: article.imageUrl,
              isMoreNews: true,
            ),
          ),
        ),
        title: Text(
          article.title,
          style:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: Sizes.b1),
        ),
      ),
    );
  }
}
