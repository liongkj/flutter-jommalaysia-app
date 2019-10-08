import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/ui/widgets/listinglist_widget.dart';

class CategoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Name.APPNAME),
      ),
      body: ListingListWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: new Image.asset('images/1.0x/icon1.png'),
              title: new Text("Route1",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
          new BottomNavigationBarItem(
              icon: new Image.asset('images/1.0x/icon2.png'),
              title: new Text("Route2",
                  style: new TextStyle(
                      color: const Color(0xFF06244e), fontSize: 14.0))),
        ],
      ),
    );
  }
}
