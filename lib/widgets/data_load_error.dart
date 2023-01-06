import 'package:flutter/material.dart';

class DataLoadError extends StatelessWidget {
  final Function loadData;
  const DataLoadError({
    super.key,
    required this.loadData,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Failed to load news.Please check\n your internet connection and try again.",
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () {
                loadData();
              },
              icon: const Icon(Icons.replay_outlined))
        ],
      ),
    );
  }
}
