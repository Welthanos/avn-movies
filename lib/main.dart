import 'package:avn_movies/pages/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/favorites.dart';
import 'pages/home.dart';

void main() {

  //Inicialização do programa
  WidgetsFlutterBinding.ensureInitialized();

  //Configurando para visualização apenas em modo retrato
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {

    //Rodando a aplicação
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Removendo o banner de debug
      debugShowCheckedModeBanner: false,

      // Título da aplicação
      title: "AVN Movies",

      // estabelecendo rota inicial
      initialRoute: '/home',

      // Todas as rotas da aplicação
      routes: {
        '/home': (context) => const Home(),
        '/favorites': (context) => const Favorites(),
        '/movie_detail': (context) => const MovieDetail(id: '', title: ''),
      },

      // Definindo a página inicial
      home: const Home(),
    );
  }
}
