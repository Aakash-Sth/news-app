import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/widgets/headline_item.dart';

class HeadlineList extends StatelessWidget {
  final List<NewsArticle> headlines;

  const HeadlineList({required this.headlines, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 15),
          child: Text(
            "Top Headlines",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 12, bottom: 20),
          height: MediaQuery.of(context).size.height * 0.318,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              NewsArticle article = headlines[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsScreen(article: article),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 35 : 0),
                  child: HeadlineItem(article: article),
                ),
              );
            },
            itemCount: headlines.length,
          ),
        )
      ],
    );
  }
}
