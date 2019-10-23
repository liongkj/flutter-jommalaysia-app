import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/providers/listings_provider.dart';
import 'package:jommalaysia/ui/widgets/home/search_bar.dart';
import 'package:jommalaysia/ui/widgets/home/shop_list_item.dart';
import 'package:provider/provider.dart';

class ShopList extends StatefulWidget {
  ShopList({@required this.selected});

  final Category selected;
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Shops"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SearchBar(
              searchControl: _searchControl,
            ),
            SizedBox(height: 10.0),
            Consumer<ListingsProvider>(
              builder: (_, model, child) => ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: model.getSubcategoryListings(widget.selected) == null
                    ? 0
                    : model.getSubcategoryListings(widget.selected).length,
                itemBuilder: (BuildContext context, int index) {
                  return ShopListItem(
                    shop: model.getSubcategoryListings(widget.selected)[index],
                    comingSoon: model.isComingSoon(widget.selected),
                    // subcategory: shopList[index],
                    // listings: model.getListings(shopList[index]),

                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.listingDetail,
                        arguments: model
                            .getSubcategoryListings(widget.selected)[index],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
