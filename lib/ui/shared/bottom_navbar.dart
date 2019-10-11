import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 7),
          IconButton(
            icon: Icon(
              Icons.home,
              size: 24.0,
            ),
            onPressed: () => _pageController.jumpToPage(0),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 24.0,
            ),
            onPressed: () => _pageController.jumpToPage(1),
          ),
          IconButton(
            icon: Icon(
              Icons.near_me,
              size: 24.0,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => _pageController.jumpToPage(2),
          ),
          IconButton(
            icon: Icon(
              Icons.event,
              size: 24.0,
            ),
            onPressed: () => _pageController.jumpToPage(3),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 24.0,
            ),
            onPressed: () => _pageController.jumpToPage(4),
          ),
          SizedBox(width: 7),
        ],
      ),
      color: Theme.of(context).primaryColor,
      shape: CircularNotchedRectangle(),
    );
  }
}
