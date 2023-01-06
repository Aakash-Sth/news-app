import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String newsUrl;
  final String title;
  const WebViewScreen({
    super.key,
    required this.newsUrl,
    required this.title,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.newsUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) => setState(() {
              isLoading = false;
            }),
          ),
          if (isLoading) const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
