import 'package:flutter/material.dart';
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
        color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
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
