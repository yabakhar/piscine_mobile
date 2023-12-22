import 'package:diaryapp/screens/home/dairy_page.dart';
import 'package:flutter/material.dart';

import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> bodys = const [ProfilePage(), DairyPage()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: bodys.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          selectedFontSize: 15,
          selectedIconTheme: const IconThemeData(
            color: Colors.deepPurple,
            size: 25,
          ),
          selectedItemColor: Colors.deepPurple,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range_outlined),
              label: 'Agenda',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
