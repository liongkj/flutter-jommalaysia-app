import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/categories_provider.dart';
import 'package:jommalaysia/core/providers/listings_provider.dart';
import 'package:jommalaysia/ui/widgets/base_change_notifier.dart';
import 'package:jommalaysia/ui/widgets/home/search_bar.dart';
import 'package:jommalaysia/ui/widgets/home/subcategory_card_item.dart';
import 'package:provider/provider.dart';

class SubcategoryGrid extends StatefulWidget {
  SubcategoryGrid({@required this.subcategoryList, @required this.selected});
  final List<Category> subcategoryList;
  final Category selected;
  @override
  _SubcategoryGridState createState() => _SubcategoryGridState();
}

class _SubcategoryGridState extends State<SubcategoryGrid> {
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build subcategory grid");
    final subcategoryList = widget.subcategoryList;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Subcategories"),
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
              builder: (_, model, child) => GridView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: subcategoryList == null ? 0 : subcategoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SubcategoryCardItem(
                    subcategory: subcategoryList[index],
                    listings:
                        model.getSubcategoryListings(subcategoryList[index]),
                    comingSoon: model.isComingSoon(subcategoryList[index]),
                    onTap: () {
                      model.isComingSoon(subcategoryList[index])
                          ? Fluttertoast.showToast(
                              msg: ("More shops coming!"),
                            )
                          : Navigator.pushNamed(context, RoutePaths.shopList,
                              arguments: {
                                  "selected": subcategoryList[index],
                                }
                              // arguments: model.categoryList,
                              );
                    },
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
