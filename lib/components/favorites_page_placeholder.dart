import 'package:flutter/material.dart';

import '../ui/movie_app_icon_icons.dart';

class FavoritesPagePlaceholder extends StatelessWidget {
  const FavoritesPagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: InkWell(
        onTap: () {},
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
                      child: Image.asset('assets/naruto.png',
                          height: 420, fit: BoxFit.cover),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Naruto Shippuden",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                  const SizedBox(height: 6),
                  
                  const Text(
                    "2022-04-18",
                    style: TextStyle(
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
                    color: const Color.fromARGB(255, 175, 0, 0),
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
