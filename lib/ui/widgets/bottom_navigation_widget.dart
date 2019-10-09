import 'package:flutter/material.dart';
import '../../core/providers/navbar_provider.dart';

import '../../ui/views/account_screen.dart';
import '../../ui/views/explore_screen.dart';
import '../../ui/views/home_screen.dart';
import '../../ui/views/search_screen.dart';

import 'base_widget.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentTab = [
    HomeScreen(),
    SearchScreen(),
    ExploreScreen(),
    // AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NavBarProvider>(
      model: NavBarProvider(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: currentTab[model.currentIndex],
          bottomNavigationBar: new BottomNavigationBar(
            currentIndex: model.currentIndex,
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.amberAccent,
            onTap: (ind) => model.switchTab(ind),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Explore'),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.account_circle),
              //   title: Text('Account'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
