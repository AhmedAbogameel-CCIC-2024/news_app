import '../models/article.dart';
import '../network_utils/network_utils.dart';

class NewsDatasource {
  Future<List<Article>> getHomeNews() async {
    List<Article> result = [];
    try {
      final response = await NetworkUtils.get(
        'top-headlines?country=us&category=business',
      );
      if (response.statusCode == 200) {
        for (var i in response.data['articles']) {
          result.add(Article.fromJson(i));
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    return result;
  }

  Future<List<Article>> getAppleNews() async {
    List<Article> result = [];
    try {
      final response = await NetworkUtils.get(
        'everything?q=apple&from=2024-09-03&to=2024-09-03&sortBy=popularity',
      );
      if (response.statusCode == 200) {
        for (var i in response.data['articles']) {
          result.add(Article.fromJson(i));
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    return result;
  }

  Future<List<Article>> getTeslaNews() async {
    List<Article> result = [];
    try {
      final response = await NetworkUtils.get(
        'everything?q=tesla&from=2024-08-04&sortBy=publishedAt',
      );
      if (response.statusCode == 200) {
        for (var i in response.data['articles']) {
          result.add(Article.fromJson(i));
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    return result;
  }
}