import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/shared/text_styles.dart';
import 'package:jommalaysia/ui/shared/ui_helpers.dart';

import 'package:jommalaysia/ui/widgets/listinglist_widget.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Listing',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(
            child: ListingListWidget(),
          )
        ],
      ),
    );
  }
}
