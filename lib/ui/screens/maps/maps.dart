import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jommalaysia/util/categories.dart';
import 'package:jommalaysia/util/restaurants.dart';

import 'google_map.dart';

//TODO add permisison handler link: https://pub.dev/packages/permission_handler
class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // GoogleMaps(),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: MediaQuery.of(context).size.width,
            child: GoogleMaps(),
          ),
        ],
      ),
    );
  }
}

class ListingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: CardRow(),
        ),
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: PageView(
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          children: <Widget>[
            ListingTile(),
            ListingTile(),
            ListingTile(),
          ],
        ),
      ),
    );
  }
}

class ListingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'detail',
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 6.0,
            ),
            elevation: 8.0,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListingLogoThumbnail(),
                ),
                Expanded(
                  child: ListingOverview(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListingLogoThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage(restaurants[0]["img"]),
        ),
      ),
    );
  }
}

class ListingOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              restaurants[0]["title"],
            ),
            Text(
              restaurants[0]["address"],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.directions),
                        SizedBox(width: 8.0),
                        Text("Direction"),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 10.0),
                FlatButton(
                  color: Colors.white,
                  textColor: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.phone),
                        SizedBox(width: 8.0),
                        Text("Call"),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
