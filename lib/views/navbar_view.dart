import 'package:databuah/views/fruitViews.dart';
import 'package:flutter/material.dart';
import '../views/newsViews.dart';
import '../views/accountViews.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    Fruitviews(),
    Newsviews(),
    Accountviews(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: "Buah",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "Berita",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Akun",
          ),
        ],
      ),
    );
  }
}

