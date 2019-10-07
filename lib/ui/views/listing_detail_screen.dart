import 'package:flutter/material.dart';

class ListingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final listingName = routeArgs['name'];
    final listingId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(listingName),
      ),
      body: Center(
        child: Text(
          listingId,
        ),
      ),
    );
  }
}
