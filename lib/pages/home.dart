import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/movie_app_icon_icons.dart';
import 'favorites.dart';
import 'movies_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Widget> _screen = [
    const MoviesPage(),
    const Favorites(),
  ];

  void _onPageChanged(int index) {}

  void _onItemTap(int index) {
    _pageController.jumpToPage(index);
    setState(
      () {
        _currentIndex = index;
        if (index == 2) {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else {
            exit(0);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 11, 0, 160),
          primaryColor: Colors.white,
        ),
        child: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme:
              const IconThemeData(color: Color.fromARGB(255, 137, 149, 253)),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => _onItemTap(index),
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.movie, size: 30),
              label: "Filmes",
            ),
            BottomNavigationBarItem(
              icon: Icon(MovieAppIcon.heart_empty, size: 24),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app, size: 30),
              label: "Sair",
            ),
          ],
        ),
      ),
    );
  }
}
