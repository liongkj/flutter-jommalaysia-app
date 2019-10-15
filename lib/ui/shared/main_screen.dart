import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/screens/event/event.dart';
import 'package:jommalaysia/ui/screens/home/home.dart';
import 'package:jommalaysia/ui/screens/maps/maps.dart';
import 'package:jommalaysia/ui/screens/search/search.dart';
import 'bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(),
          // Search(),
          Maps(),
          Event(),
          // Home(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        pageController: _pageController,
        page: _page,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.near_me,
        ),
        onPressed: () => _pageController.jumpToPage(1),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
