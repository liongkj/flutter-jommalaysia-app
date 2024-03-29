import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/models/listing.dart';
import 'package:jommalaysia/core/providers/listings_provider.dart';
import 'package:provider/provider.dart';

class SubcategoryCardItem extends StatelessWidget {
  SubcategoryCardItem(
      {Key key,
      @required this.subcategory,
      @required this.listings,
      @required this.onTap,
      @required this.comingSoon})
      : super(key: key);

  final Category subcategory;
  final List<Listing> listings;
  final bool comingSoon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          elevation: 3.0,
          child: InkWell(
            onTap: onTap,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          "${subcategory.categoryThumbnail.thumbnailUrl}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6.0,
                      right: 6.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6.0,
                      left: 6.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: comingSoon
                                ? Text(
                                    "MORE SHOPS COMING SOON",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Consumer<ListingsProvider>(
                                    builder: (context, model, child) => Text(
                                      model
                                                  .getSubcategoryListings(
                                                      subcategory)
                                                  .length >
                                              1
                                          ? "${model.getSubcategoryListings(subcategory).length} Shops available"
                                          : "${model.getSubcategoryListings(subcategory).length} Shop available",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "${subcategory.categoryName}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 7.0),
                //Subcategory Count
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
