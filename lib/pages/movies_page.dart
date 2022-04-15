import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {

  const MoviesPage({ Key? key }) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}