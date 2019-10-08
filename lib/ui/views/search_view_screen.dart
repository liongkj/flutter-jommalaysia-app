import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/shared/text_styles.dart';
import 'package:jommalaysia/ui/shared/ui_helpers.dart';
import 'package:jommalaysia/ui/widgets/appbar_widget.dart';
import 'package:jommalaysia/ui/widgets/listinglist_widget.dart';

class SearchViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("12"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge,
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
