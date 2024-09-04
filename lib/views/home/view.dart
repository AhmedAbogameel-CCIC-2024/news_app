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
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          final cubit = HomeCubit.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.currentViewTitle),
            ),
            body: SafeArea(
              child: Builder(
                builder: (context) {
                  final articles = cubit.currentViewArticles;
                  if (state is HomeLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    controller: cubit.scrollController,
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
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentViewIndex,
              onTap: cubit.changeView,
              selectedIconTheme: IconThemeData(color: Colors.black),
              unselectedIconTheme: IconThemeData(color: Colors.grey.withOpacity(0.5)),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apple),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.electric_bolt_sharp),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
