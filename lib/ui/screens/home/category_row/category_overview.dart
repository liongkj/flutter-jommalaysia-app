import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/categories_provider.dart';
import 'package:jommalaysia/ui/widgets/home/category_slide_item.dart';
import 'package:provider/provider.dart';

class CategoryOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoriesProvider>(
        context,
        listen: false,
      ).prepareData(),
      builder: (context, dataSnapshot) {
        return Consumer<CategoriesProvider>(
          builder: (context, data, child) => Column(
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
                      "See all (${data.categories.length})",
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
                          itemCount: data.categories == null
                              ? 0
                              : data.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            Category category = data.categories[index];
                            final subcategories = data.getSubcategory(category);
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: CategorySlideItem(
                                img: category.image.thumbnailUrl,
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
