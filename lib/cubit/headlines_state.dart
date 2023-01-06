part of 'headlines_cubit.dart';

abstract class HeadlinesState extends Equatable {
  const HeadlinesState();

  @override
  List<Object> get props => [];
}

class HeadlinesLoading extends HeadlinesState {}

class HeadlinesLoaded extends HeadlinesState {
  final List<NewsArticle> headlines;
  const HeadlinesLoaded({required this.headlines});

  @override
  List<Object> get props => [headlines];
}

class HeadlineLoadError extends HeadlinesState {}
