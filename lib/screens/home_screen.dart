import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/headlines_cubit.dart';
import 'package:news_app/cubit/more_news_cubit.dart';
import 'package:news_app/locators.dart';
import 'package:news_app/services/interceptors/retry_interceptor.dart';
import 'package:news_app/widgets/data_load_error.dart';
import 'package:news_app/widgets/headline_list.dart';
import 'package:news_app/widgets/more_news_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() => loadData());
    getIt.get<Dio>().interceptors.add(
          RetryInterceptor(),
        );
    super.initState();
  }

  void loadData() {
    context.read<HeadlinesCubit>().loadHeadlines();
    context.read<MoreNewsCubit>().loadMoreNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.headline1,
            children: const [
              TextSpan(
                text: "Fw",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F5753),
                ),
              ),
              TextSpan(text: "News")
            ],
          ),
        ),
      ),
      body: BlocBuilder<HeadlinesCubit, HeadlinesState>(
        builder: (context, headlineState) {
          return BlocBuilder<MoreNewsCubit, MoreNewsState>(
            builder: (context, moreNewsState) {
              if (headlineState is HeadlinesLoading ||
                  moreNewsState is MoreNewsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (headlineState is HeadlineLoadError ||
                  moreNewsState is MoreNewsLoadError) {
                return DataLoadError(loadData: loadData);
              } else if (headlineState is HeadlinesLoaded &&
                  moreNewsState is MoreNewsLoaded) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: HeadlineList(
                        headlines: headlineState.headlines,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35, bottom: 10),
                        child: Text(
                          "More News",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    MoreNewsList(
                      moreNews: moreNewsState.moreNews,
                    )
                  ],
                );
              } else {
                return const Center(
                  child: Text("An error occured"),
                );
              }
            },
          );
        },
      ),
    );
  }
}
