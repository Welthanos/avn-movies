import 'package:avn_movies/components/posters.dart';
import 'package:flutter/material.dart';

import '../components/description.dart';
import '../components/genres.dart';

class MovieDetail extends StatelessWidget {
  final String id;
  final String title;

  const MovieDetail({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 0, 160),
        title: const Text(
          'Filmes',
          style: TextStyle(
            color: Color.fromARGB(255, 192, 198, 255),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 192, 198, 255),
        ),
      ),

      // Corpo da página de detalhes
      body: Container(

        // Background (cor cinza e branco)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 1.0),
            end: Alignment(1.0, -1.0),
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 131, 131, 131),
            ],
          ),
        ),

        child: ListView(
          children: [

            // Recebendo o id de Posters para confeccionar a tela
            Posters(id: id),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    "Categorias: ",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),

                  // Recebendo o id de Genres para confeccionar a tela
                  Genres(id: id),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Recebendo o id de Description para confeccionar a tela
            Description(id: id),
          ],
        ),
      ),
    );
  }
}
