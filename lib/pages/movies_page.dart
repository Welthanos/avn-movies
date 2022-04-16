import 'dart:convert';

import 'package:flutter/material.dart';

import '../components/movie_card.dart';

import 'package:http/http.dart' as http;

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<dynamic> movieList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=acd2834a5e053a947ed184cacbfba58b&language=en-US&page=1");
    var response = await http.get(url);
    List<dynamic> list = jsonDecode(response.body)["results"];
    setState(() {
      movieList = [...list];
    });
  }

  void pressButton() {
    if (movieList.isEmpty) {
      print(movieList.length);
    } else {
      for (var item in movieList) {
        print(item["title"]);
      }
    }
  }

  InputDecoration fieldDecor = InputDecoration(
    filled: true,
    fillColor: const Color.fromARGB(255, 11, 0, 160),
    prefixIcon: const Icon(
      Icons.search,
      color: Color.fromARGB(255, 137, 149, 253),
    ),
    labelText: ' Pesquisar ...',
    hintText: 'Ex.: Homem Aranha',
    hintStyle: const TextStyle(color: Color.fromARGB(255, 137, 149, 253)),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: const TextStyle(
      color: Color.fromARGB(255, 137, 149, 253),
    ),
    contentPadding: const EdgeInsets.all(0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
  );

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
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, 1.0),
            end: Alignment(1.0, -1.0),
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 175, 175, 175),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 192, 198, 255),
                    ),
                    cursorColor: const Color.fromARGB(255, 192, 198, 255),
                    decoration: fieldDecor,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Color.fromARGB(255, 11, 0, 160),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Filmes Populares",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 11, 0, 160),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 510,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieList.length,
                      itemBuilder: (context, index) {
                        if (movieList.isEmpty) {
                          return const Text("lista vazia");
                        } else {
                          final movie = movieList[index];
                          return MovieCard(
                            title: movie["original_title"],
                            releaseDate: movie["release_date"],
                            posterPath: movie["poster_path"],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
