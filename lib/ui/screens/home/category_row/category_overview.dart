import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/categories_provider.dart';
import 'package:jommalaysia/ui/widgets/home/category_slide_item.dart';
import 'package:provider/provider.dart';

class CategoryOverview extends StatefulWidget {
  @override
  _CategoryOverviewState createState() => _CategoryOverviewState();
}

class _CategoryOverviewState extends State<CategoryOverview> {
  Future<void> prepareData;
  @override
  void initState() {
    super.initState();
    prepareData =
        Provider.of<CategoriesProvider>(context, listen: false).prepareData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: prepareData,
      builder: (context, dataSnapshot) {
        return Consumer<CategoriesProvider>(
          builder: (_, model, child) => Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "See all (${model.categories.length})",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RoutePaths.categoryGrid,
                      // arguments: model.categoryList,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0),

              //Horizontal List here
              Container(
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: dataSnapshot.connectionState == ConnectionState.waiting
                      ? RefreshProgressIndicator()
                      : ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.categories == null
                              ? 0
                              : model.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            Category category = model.categories[index];
                            final subcategories =
                                model.getSubcategory(category);
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: CategorySlideItem(
                                img: category.categoryThumbnail.thumbnailUrl,
                                title: category.categoryName,
                                subcategories: subcategories,
                              ),
                            );
                          },
                        ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
