import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:news_app/widgets/custom_image.dart';

class NewsScreen extends StatelessWidget {
  final NewsArticle article;
  const NewsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    String? content = article.content ?? article.description;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      persistentFooterButtons: [
        CustomButton(newsUrl: article.newsUrl, title: article.title)
      ],
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(
                  color:
                      article.imageUrl == null ? Colors.black : Colors.white),
              expandedHeight: screenSize.height * 0.315,
              stretch: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                  background: CustomImage(imageUrl: article.imageUrl)),
            ),
            SliverFillRemaining(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 15),
                child: Column(
                  children: [
                    Column(
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
