import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jommalaysia/ui/screens/maps/listing_list.dart';
import 'package:jommalaysia/util/categories.dart';
import 'package:jommalaysia/util/restaurants.dart';

import 'google_map.dart';

//TODO add permisison handler link: https://pub.dev/packages/permission_handler
class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  PageController _pageController;
  List<Marker> _nearbyListing = [];
  final LatLng _center = const LatLng(40.7128, -74.0060);

  @override
  void initState() {
    super.initState();

    restaurants.forEach((loc) {
      _nearbyListing.add(
        Marker(
            markerId: MarkerId(
              loc["title"],
            ),
            draggable: false,
            infoWindow: InfoWindow(
              title: loc["title"],
              snippet: loc["address"],
            ),
            position: loc["LatLng"]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // GoogleMaps(),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: MediaQuery.of(context).size.width,
            child: GoogleMaps(
              pageController: _pageController,
              nearbyListing: _nearbyListing,
              initialCoord: _center,
            ),
          ),
        ],
      ),
    );
  }
}
