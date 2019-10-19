import 'package:flutter/material.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/widgets/categories_provider.dart';
import 'package:provider/provider.dart';

import '../base_change_notifier.dart';

class ListCardItem extends StatelessWidget {
  ListCardItem({Key key, @required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifier<CategoriesProvider>(
      onModelReady: (model) => model.getSubcategory(category),
      builder: (context, model, child) => Padding(
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
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          "${category.categoryNameMs}",
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
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: model.isComingSoon(category)
                              ? Text(
                                  "COMING SOON",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  "${model.getSubcategory(category).length}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
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
