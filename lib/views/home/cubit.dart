import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/article.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  List<Article> articles = [];

  Future<void> getNews() async {
    emit(HomeLoading());
    try {
      final response = await Dio().get(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df1a070b89e64ce78ba286cea86af31b',
      );
      if (response.statusCode == 200) {
        for (var i in response.data['articles']) {
          articles.add(Article.fromJson(i));
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(HomeInit());
  }
}

