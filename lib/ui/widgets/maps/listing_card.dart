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
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) *
                (MediaQuery.of(context).size.height),
            width: Curves.easeInOut.transform(value) *
                (MediaQuery.of(context).size.height),
            child: widget,
          ),
        );
      },
      child: Hero(
        tag: 'detail',
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
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
      ),
    );
  }
}
