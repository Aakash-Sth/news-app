part of 'more_news_cubit.dart';

abstract class MoreNewsState extends Equatable {
  const MoreNewsState();

  @override
  List<Object> get props => [];
}

class MoreNewsLoading extends MoreNewsState {}

class MoreNewsLoaded extends MoreNewsState {
  final List<NewsArticle> moreNews;
  const MoreNewsLoaded({required this.moreNews});

  @override
  List<Object> get props => [moreNews];
}

class MoreNewsLoadError extends MoreNewsState {}
