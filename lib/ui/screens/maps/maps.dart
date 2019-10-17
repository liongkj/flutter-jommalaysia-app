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
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CardRow(),
        ),
      ),
    ));
  }
}

class CardRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        ListingTile(),
        ListingTile(),
        ListingTile(),
      ],
    );
  }
}

class ListingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'detail',
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Card(
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
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Image(
        fit: BoxFit.fitWidth,
        image: AssetImage(restaurants[0]["img"]),
      ),
    );
  }
}

class ListingOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                restaurants[0]["title"],
              ),
              Text(
                restaurants[0]["address"],
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text("Direction"),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text("Call"),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
