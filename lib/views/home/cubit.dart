import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/datasources/news.dart';
import 'package:news_app/core/network_utils/network_utils.dart';

import '../../core/models/article.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  int currentViewIndex = 0;

  final _datasource = NewsDatasource();

  ScrollController scrollController = ScrollController();

  List<Article> homeArticles = [];
  List<Article> appleArticles = [];
  List<Article> teslaArticles = [];

  Future<void> getNews() async {
    emit(HomeLoading());
    await Future.wait([
      _datasource.getHomeNews(),
      _datasource.getAppleNews(),
      _datasource.getTeslaNews(),
    ]).then((value) {
      homeArticles = value[0];
      appleArticles = value[1];
      teslaArticles = value[2];
    });
    emit(HomeInit());
  }

  String get currentViewTitle => ["Home", "Apple", "Tesla"][currentViewIndex];

  List<Article> get currentViewArticles => [
        homeArticles,
        appleArticles,
        teslaArticles,
      ][currentViewIndex];

  void changeView(int value) {
    scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    currentViewIndex = value;
    emit(HomeInit());
  }
}

