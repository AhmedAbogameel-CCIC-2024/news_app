import 'package:flutter/material.dart';

import 'core/network_utils/network_utils.dart';
import 'views/home/view.dart';

void main() {
  NetworkUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}
