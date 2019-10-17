import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<GoogleMaps> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    print("google map");
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
        markers: {
          Marker(
            markerId: MarkerId("test marker"),
            position: _center,
            infoWindow: InfoWindow(title: "KFC"),
            icon: BitmapDescriptor.defaultMarker,
          )
        },
      ),
    );
  }
}
