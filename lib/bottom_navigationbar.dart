import 'package:flutter/material.dart';

class NavigationButtom extends StatefulWidget {
  const NavigationButtom({super.key});

  @override
  State createState() => _NavigationButtomState();
}

class _NavigationButtomState extends State<NavigationButtom> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_add),
          label: 'Notifications',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.pink,  
      onTap: _onItemTapped,
    );
  }
}
