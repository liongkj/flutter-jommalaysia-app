import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/widgets/listing_viewmodel.dart';

import 'package:provider/provider.dart';
import './base_widget.dart';
import 'listinglist_item.dart';

class ListingListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ListingViewModel>(
      model: ListingViewModel(listingService: Provider.of(context)),
      onModelReady: (model) => model.fetchListings(),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.listings.length,
              itemBuilder: (context, index) => ListingListItem(
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
