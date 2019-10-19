import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/widgets/categories_provider.dart';
import 'package:jommalaysia/ui/widgets/base_change_notifier.dart';
import 'package:jommalaysia/ui/widgets/home/category_slide_item.dart';
import 'package:provider/provider.dart';

import 'category_list.dart';

class CategoryScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifier<CategoriesProvider>(
      model: CategoriesProvider(
        categoryService: Provider.of(context),
      ),
      onModelReady: (model) {
        model.prepareData();
      },
      builder: (context, model, child) => Column(
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
              model.state == ViewState.busy
                  ? RefreshProgressIndicator()
                  : FlatButton(
                      child: Consumer<CategoriesProvider>(
                        builder: (context, model, child) =>
                            model.subcategories == null
                                ? CircularProgressIndicator()
                                : Text(
                                    "See all (${model.categoryList.length})",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutePaths.categoryList,
                          arguments: {
                            model.categoryList,
                            model.subcategories,
                          },
                        );
                      },
                    ),
            ],
          ),

          SizedBox(height: 10.0),

          //Horizontal List here
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width,
            child: Consumer<CategoriesProvider>(
              builder: (context, model, child) => ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:
                    model.categoryList == null ? 0 : model.categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  Category category = model.categoryList[index];
                  final subcategories = model.getSubcategory(category);
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: CategorySlideItem(
                      img: category.image,
                      title: category.categoryName,
                      subcategories: subcategories,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
