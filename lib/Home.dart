import 'package:flutter/material.dart';

import 'Photo.dart';
import 'Profile.dart';
import 'Walk.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
      ),
      body: Center(
        child: TabPage(),
      ),
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages = [Profile(), Walk(), Photo()];
  void _onItemTapped(int index) {
    // state 갱신
    setState(() {
      _selectedIndex = index; // index는 item 순서로 0, 1, 2로 구성
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person),label: '프로필'),

          BottomNavigationBarItem(icon: Icon(Icons.navigation),label: '산책'),

          BottomNavigationBarItem(icon: Icon(Icons.photo),label: '사진'),

        ],
      ),
    );
  }

}
