import 'package:avn_movies/pages/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/favorites.dart';
import 'pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AVN Movies",
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/favorites': (context) => const Favorites(),
        '/movie_detail': (context) => const MovieDetail(),
      },
      home: const Home(),
    );
  }
}
