import 'package:flutter/material.dart';
import 'package:news_app/extensions/nav_extension.dart';

import '../screens/webview_screen.dart';
import '../theme/sizes.dart';

class CustomButton extends StatelessWidget {
  final String newsUrl;
  final String title;
  const CustomButton({super.key, required this.newsUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        context.push(
          WebViewScreen(
            newsUrl: newsUrl,
            title: title,
          ),
        );
      },
      padding: const EdgeInsets.symmetric(vertical: 15),
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.black,
      textColor: Colors.white,
      child: const Text(
        "Read More",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: Sizes.b1),
      ),
    );
  }
}
