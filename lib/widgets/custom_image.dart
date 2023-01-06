import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/image_error.dart';

class CustomImage extends StatelessWidget {
  final String? imageUrl;
  final bool isMoreNews;
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.isMoreNews = false,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? ImageError(isMoreNews: isMoreNews)
        : CachedNetworkImage(
            imageUrl: imageUrl as String,
            errorWidget: (context, error, stackTrace) =>
                ImageError(isMoreNews: isMoreNews),
            fit: BoxFit.cover,
          );
  }
}
