import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Genres extends StatefulWidget {
  const Genres({Key? key}) : super(key: key);

  @override
  _GenresState createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  var genreList = [];

  @override
  void initState() {
    getGenre();
    super.initState();
  }

  Future getGenre() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/634649?api_key=acd2834a5e053a947ed184cacbfba58b&language=pt-br&append_to_response=images,credits&include_image_language=en,pt-br");
    var response = await http.get(url);
    var list = jsonDecode(response.body)["genres"];
    setState(() {
      genreList = [...list];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genreList.length,
        itemBuilder: (context, index) {
          if (genreList.isEmpty) {
            return const Text("");
          } else {
            final genre = genreList[index];
            return Text(
              "${genre["name"]}  |  ",
              style: const TextStyle(fontSize: 15),
            );
          }
        },
      ),
    );
  }
}
