import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/category.dart';

class CategoryCardItem extends StatelessWidget {
  CategoryCardItem(
      {Key key,
      @required this.category,
      @required this.shopCount,
      @required this.items,
      @required this.onTap,
      @required this.comingSoon})
      : super(key: key);

  final Category category;
  final List<Category> items;
  final bool comingSoon;
  final Function onTap;
  final int shopCount;
  @override
  Widget build(BuildContext context) {
    print("build category card " + category.categoryName);

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
                      foregroundDecoration: comingSoon
                          ? BoxDecoration(
                              color: Colors.grey,
                              backgroundBlendMode: BlendMode.saturation,
                            )
                          : null,
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          "${category.categoryThumbnail.url}",
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
                                : Text(
                                    shopCount > 1
                                        ? "$shopCount shops available"
                                        : "$shopCount shop available",
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
                  ],
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "${category.categoryName}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
