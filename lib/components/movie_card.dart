import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {Key? key,
      required this.title,
      required this.releaseDate,
      this.posterPath})
      : super(key: key);

  final dynamic posterPath;
  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/movie_detail'),
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
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${posterPath}',
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
          ],
        ),
      ),
    );
  }
}
