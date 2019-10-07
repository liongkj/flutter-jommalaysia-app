import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/viewmodels/listings_viewmodel.dart';
import 'package:provider/provider.dart';

class ListingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListingsViewModel>.value(
      value: ListingsViewModel(
        listingService: Provider.of(context),
      ),
      child: Consumer<ListingsViewModel>(
        builder: (context, model, child) => Scaffold(
            body: Container(
          child: model.viewState == ViewState.Busy
              ? CircularProgressIndicator
              : FlatButton(
                  color: Colors.blue,
                  child: Text("fetch data"),
                  onPressed: () {
                    model.fetchListings();
                  },
                ),
        )

            // child: GridView(
            //   padding: const EdgeInsets.all(25),
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200,
            //     childAspectRatio: 3 / 2,
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20,
            //   ),
            //   children: DUMMY_LISTING
            //       .map((x) => ListingItem(
            //             x.id,
            //             x.name,
            //             x.type,
            //           ))
            //       .toList(),
            // ),
            ),
      ),
    );
  }
}
