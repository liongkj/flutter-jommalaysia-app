import 'package:flutter/material.dart';

import 'listing_logo_thumbnail.dart';
import 'listing_tile_overview.dart';

class ListingCard extends StatelessWidget {
  ListingCard({this.pageController, this.index});
  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Hero(
          tag: 'detail',
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 8.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ListingLogoThumbnail(),
                    ListingOverview(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      // child:
    );
  }
}
