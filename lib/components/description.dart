import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  var description = "";

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/634649?api_key=acd2834a5e053a947ed184cacbfba58b&language=pt-br&append_to_response=images,credits&include_image_language=en,pt-br");
    var response = await http.get(url);
    var text = jsonDecode(response.body)["overview"];
    setState(() {
      description = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(description, style: const TextStyle(fontSize: 16),),
      ),
    );
  }
}
