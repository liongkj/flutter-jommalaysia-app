import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jommalaysia/util/restaurants.dart';

import 'listing_list.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps(
      {Key key, this.pageController, this.initialCoord, this.nearbyListing})
      : super(key: key);
  PageController pageController;
  final LatLng initialCoord;
  final List<Marker> nearbyListing;

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<GoogleMaps> {
  GoogleMapController _mapController;
  int prevPage;
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.pageController =
        PageController(initialPage: 1, viewportFraction: 0.8)
          ..addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.pageController.page.toInt() != prevPage) {
      prevPage = widget.pageController.page.toInt();
      moveCamera();
    }
  }

  void moveCamera() {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: restaurants[widget.pageController.page.toInt()]["LatLng"],
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: widget.initialCoord,
              zoom: 12.0,
            ),
            markers: Set.from(widget.nearbyListing),
          ),
        ),
        Container(
          child: ListingList(
            pageController: widget.pageController,
            noOfListing: widget.nearbyListing.length,
          ),
        )
      ],
    );
  }
}
