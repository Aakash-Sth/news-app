import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/headlines_cubit.dart';
import 'package:news_app/cubit/more_news_cubit.dart';
import 'package:news_app/locators.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/theme/app_theme.dart';

import 'services/news_service.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NewsService service = NewsService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HeadlinesCubit(newsService: service)..loadHeadlines(),
        ),
        BlocProvider(
          create: (_) => MoreNewsCubit(newsService: service)..loadMoreNews(),
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        routes: {"/": (context) => const HomeScreen()},
      ),
    );
  }
}
