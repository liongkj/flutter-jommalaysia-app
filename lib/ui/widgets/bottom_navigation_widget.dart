import 'package:flutter/material.dart';
import 'package:jommalaysia/core/viewmodels/home_viewmodel.dart';
import 'package:jommalaysia/ui/views/account_screen.dart';
import 'package:jommalaysia/ui/views/explore_screen.dart';
import 'package:jommalaysia/ui/views/home_screen.dart';
import 'package:jommalaysia/ui/views/search_screen.dart';

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
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: currentTab[model.currentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: model.currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (ind) => model.currentIndex = ind,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('Account'),
            ),
          ],
        ),
      ),
    );
  }
}
