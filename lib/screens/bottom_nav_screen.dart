import 'package:covid_app/screens/emergency.dart';
import 'package:covid_app/screens/home_screen.dart';
import 'package:covid_app/screens/info_screen.dart';
import 'package:covid_app/screens/state_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final List _screens = [
    StateScreen(),
    HomeScreen(),
    emergencyScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          body: _screens[_currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.black45,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Color.fromARGB(255, 111, 4, 138),
              height: 50,               /// 60.0
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 400),
              index: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              items: const <Widget>[
                Icon(Icons.home, size: 30),
                Icon(Icons.event_note_rounded, size: 30),
                Icon(Icons.call, size: 30),
                Icon(Icons.info, size: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
