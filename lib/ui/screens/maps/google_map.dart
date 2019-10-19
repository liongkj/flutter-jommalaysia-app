import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jommalaysia/core/models/place_location.dart';
import 'package:jommalaysia/util/restaurants.dart';

import 'listing_list.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps(
      {Key key, this.pageController, this.initialCoord, this.nearbyListing})
      : super(key: key);
  final PageController pageController;
  final PlaceLocation initialCoord;
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
    super.initState();
    widget.pageController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    final LatLng coor =
        restaurants[widget.pageController.page.toInt()]["LatLng"];

    if (widget.pageController.page.toInt() != prevPage) {
      prevPage = widget.pageController.page.toInt();
      await _mapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: coor,
        zoom: 16.0,
        bearing: 45.0,
        tilt: 45.0,
      )));
    }
  }

  void onCameraStop() {
    _mapController.animateCamera(CameraUpdate.scrollBy(0, 10));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Container(
        //   child: GoogleMap(
        //     padding: EdgeInsets.only(
        //       bottom: MediaQuery.of(context).size.height * 0.4,
        //     ),
        //     onMapCreated: _onMapCreated,
        //     mapType: MapType.normal,
        //     myLocationButtonEnabled: true,
        //     initialCameraPosition: CameraPosition(
        //       target: LatLng(
        //         widget.initialCoord.latitude,
        //         widget.initialCoord.longitude,
        //       ),
        //       zoom: 12.0,
        //     ),
        //     zoomGesturesEnabled: true,
        //     tiltGesturesEnabled: false,
        //     trafficEnabled: false,
        //     markers: Set.from(widget.nearbyListing),
        //   ),
        // ),
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
