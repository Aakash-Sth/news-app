import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/services/news_service.dart';

import '../models/news_article.dart';

part 'headlines_state.dart';

class HeadlinesCubit extends Cubit<HeadlinesState> {
  final NewsService _newsService;
  HeadlinesCubit({required NewsService newsService})
      : _newsService = newsService,
        super(HeadlinesLoading());

  void loadHeadlines() async {
    emit(HeadlinesLoading());
    List<NewsArticle> headlines = await _newsService.getTopHeadlineNews();
    headlines.isEmpty
        ? emit(HeadlineLoadError())
        : emit(
            HeadlinesLoaded(
              headlines: headlines,
            ),
          );
  }
}
