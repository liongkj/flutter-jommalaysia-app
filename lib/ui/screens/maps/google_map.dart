import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jommalaysia/util/restaurants.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<GoogleMaps> {
  GoogleMapController _controller;

  List<Marker> _nearbyListing = [];
  final LatLng _center = const LatLng(40.7128, -74.0060);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }

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
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0,
        ),
        markers: Set.from(_nearbyListing),
      ),
    );
  }
}
