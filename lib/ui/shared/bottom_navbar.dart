import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final PageController pageController;
  final int page;

  get _page => page;
  BottomNavBar({this.pageController, this.page});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 7),
          IconButton(
            color: _page == 0
                ? Theme.of(context).accentColor
                : Theme.of(context).textTheme.caption.color,
            icon: Icon(
              Icons.home,
              size: 24.0,
            ),
            onPressed: () => pageController.jumpToPage(0),
          ),
          // IconButton(
          //   color: _page == 1
          //       ? Theme.of(context).accentColor
          //       : Theme.of(context).textTheme.caption.color,
          //   icon: Icon(
          //     Icons.search,
          //     size: 24.0,
          //   ),
          //   onPressed: () => pageController.jumpToPage(1),
          // ),
          IconButton(
            color: _page == 2
                ? Theme.of(context).accentColor
                : Theme.of(context).textTheme.caption.color,
            icon: Icon(
              Icons.near_me,
              size: 24.0,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => pageController.jumpToPage(1),
          ),
          IconButton(
            color: _page == 3
                ? Theme.of(context).accentColor
                : Theme.of(context).textTheme.caption.color,
            icon: Icon(
              Icons.event,
              size: 24.0,
            ),
            onPressed: () => pageController.jumpToPage(2),
          ),
          // IconButton(
          //   color: _page == 4
          //       ? Theme.of(context).accentColor
          //       : Theme.of(context).textTheme.caption.color,
          //   icon: Icon(
          //     Icons.person,
          //     size: 24.0,
          //   ),
          //   onPressed: () => pageController.jumpToPage(4),
          // ),
          SizedBox(width: 7),
        ],
      ),
      color: Theme.of(context).primaryColor,
      shape: CircularNotchedRectangle(),
    );
  }
}
