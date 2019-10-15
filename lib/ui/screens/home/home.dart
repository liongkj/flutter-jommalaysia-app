import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/screens/home/private_listing.dart';
import 'package:jommalaysia/ui/screens/home/upcoming_event.dart';
import 'package:jommalaysia/ui/widgets/my_appbar.dart';

import 'gov_listing.dart';
import 'nearby_listing.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MyAppBar(
        searchControl: _searchControl,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            NearbyListings(),
            SizedBox(height: 10.0),
            PrivateListings(),
            SizedBox(height: 20.0),
            GovListings(),
            SizedBox(height: 30.0),
            UpcomingEvents(),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
