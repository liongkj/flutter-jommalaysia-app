import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jommalaysia/ui/widgets/maps/listing_card.dart';

class ListingList extends StatelessWidget {
  ListingList({
    this.pageController,
    this.noOfListing,
  });
  final PageController pageController;
  final int noOfListing;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          
          pageSnapping: true,
          controller: pageController,
          itemCount: noOfListing,
          itemBuilder: (context, index) => ListingCard(
            pageController: pageController,
            index: index,
          ),
        ),
      ),
    );
  }
}
