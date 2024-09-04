import 'dart:async';

import 'package:dio/dio.dart';

abstract class NetworkUtils {
  static Dio _dio = Dio();
  static const String _apiKey = 'df1a070b89e64ce78ba286cea86af31b';

  static Future<void> init() async {
    _dio.options = BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      validateStatus: (status) => true,
      queryParameters: {'apiKey': _apiKey},
    );
  }

  static Future<Response> get(String path) async {
    return _dio.get(path);
  }
}
