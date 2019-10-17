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
          ListingRow(),
        ],
      ),
    );
  }
}

class ListingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CardRow(),
        ),
      ),
    ));
  }
}

class CardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ListingTile(),
          ListingTile(),
          ListingTile(),
        ],
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
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.yellow,
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
    );
  }
}

class ListingLogoThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
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
                OutlineButton(
                  textColor: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
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
