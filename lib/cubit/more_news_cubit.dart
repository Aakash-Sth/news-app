import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/news_article.dart';
import '../services/news_service.dart';

part 'more_news_state.dart';

class MoreNewsCubit extends Cubit<MoreNewsState> {
  final NewsService _newsService;

  MoreNewsCubit({required NewsService newsService})
      : _newsService = newsService,
        super(MoreNewsLoading());

  void loadMoreNews() async {
    emit(MoreNewsLoading());
    List<NewsArticle> moreNews = await _newsService.getMoreNews();
    moreNews.isEmpty
        ? emit(MoreNewsLoadError())
        : emit(
            MoreNewsLoaded(moreNews: moreNews),
          );
  }
}
