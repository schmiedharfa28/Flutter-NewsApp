import 'package:flutter/material.dart';
import 'package:news_app/menu.dart';
import 'package:news_app/news_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectednavBar = 0;
  void _changeselectedNavBar(int index) {
    setState(() {
      _selectednavBar = index;
    });
  }

  final _widgetOptions = [
    NewsPage(),
    Menu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectednavBar],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _changeselectedNavBar,
        backgroundColor: Colors.black,
        currentIndex: _selectednavBar,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
                size: 20,
              ),
              activeIcon: Icon(
                Icons.menu_book,
                color: Colors.white,
                size: 20,
              ),
              label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_sharp,
                size: 20,
              ),
              activeIcon: Icon(
                Icons.account_balance_sharp,
                size: 20,
                color: Colors.white,
              ),
              label: 'Menu'),
        ],
      ),
    );
  }
}
