import 'package:avn_movies/pages/movie_detail.dart';
import 'package:flutter/material.dart';

import '../ui/movie_app_icon_icons.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {Key? key,
      required this.title,
      required this.releaseDate,
      this.posterPath,
      required this.id})
      : super(key: key);

  final dynamic posterPath;
  final String title;
  final String releaseDate;
  final String id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: InkWell(
        // Configurando a rota para a página de detalhes do filme selecionado
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetail(id: id, title: title))),

        // Propriedades dos cards
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      // Checando valores nulos para imagens
                      child: posterPath == null
                          ? Container(
                              color: Colors.blueGrey,
                              height: 420,
                            )
                          : Image.network(
                              'https://image.tmdb.org/t/p/w500$posterPath',
                              height: 420,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    releaseDate,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(221, 53, 53, 53),
                    ),
                  ),
                ],
              ),
            ),

            // Botão de favoritos ainda estático
            Positioned(
              bottom: 50,
              right: 4,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: const Color.fromARGB(255, 233, 233, 233),
                  height: 55,
                  child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () {},
                    iconSize: 20,
                    icon: const Icon(MovieAppIcon.heart),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
