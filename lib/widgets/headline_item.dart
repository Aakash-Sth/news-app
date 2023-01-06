import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/widgets/custom_image.dart';

class HeadlineItem extends StatelessWidget {
  final NewsArticle article;
  const HeadlineItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: screenSize.width * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: screenSize.height * 0.3,
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.2,
            width: screenSize.width * 0.65,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: CustomImage(imageUrl: article.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.headline6,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
