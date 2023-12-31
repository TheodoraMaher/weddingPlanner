import 'package:flutter/material.dart';
import 'package:weddingplaner/pages/category.dart';
import 'package:weddingplaner/pages/products.dart';
import 'package:weddingplaner/pages/profile.dart';

import '../constants.dart';
import '../pages/favorite.dart';


class bottonnavbar extends StatefulWidget {
  const bottonnavbar({Key? key}) : super(key: key);

  @override
  State<bottonnavbar> createState() => _bottonnavbarState();
}

class _bottonnavbarState extends State<bottonnavbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,

      body: SelectedIndexPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'category',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions_rounded),
            label: 'me',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,

      ),
    );
  }
  Widget SelectedIndexPage(){
    switch(_selectedIndex){
      case 0: return productsEvent() ;
      case 1: return categoryEvent(); /// Hna ely 3aozah yzhr fe page categories
      default: return profile(); /// hna ely 3aozah yzhr fe page me
    }
  }

}
