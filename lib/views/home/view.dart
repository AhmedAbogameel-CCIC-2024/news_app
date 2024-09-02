import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/views/home/cubit.dart';
import 'package:news_app/views/home/states.dart';

import '../../widgets/app/news_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getNews(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              final cubit = HomeCubit.of(context);
              final articles = cubit.articles;
              if (state is HomeLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                padding: EdgeInsets.all(16),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return NewsCard(
                    article: article,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16),
              );
            },
          ),
        ),
      ),
    );
  }
}
