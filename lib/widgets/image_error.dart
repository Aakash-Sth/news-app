import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  final bool isMoreNews;

  const ImageError({
    super.key,
    required this.isMoreNews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: isMoreNews ? 30 : 35,
        ),
        if (!isMoreNews) const Text("Image not available")
      ],
    );
  }
}
