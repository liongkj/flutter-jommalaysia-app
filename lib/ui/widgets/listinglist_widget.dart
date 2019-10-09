import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/providers/widgets/listings_provider.dart';
import '../../core/enums/viewstate.dart';

import 'package:provider/provider.dart';
import './base_widget.dart';
import 'listing_item.dart';

class ListingListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ListingsProvider>(
      model: ListingsProvider(listingService: Provider.of(context)),
      onModelReady: (model) => model.fetchListings(),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.listings.length,
              itemBuilder: (context, index) => ListingItem(
                listing: model.listings[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.LISTINGINFO,
                    arguments: model.listings[index],
                  );
                },
              ),
            ),
    );
  }
}
