import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/categories_provider.dart';
import 'package:jommalaysia/ui/widgets/base1_change_notifier.dart';
import 'package:jommalaysia/ui/widgets/base_change_notifier.dart';
import 'package:jommalaysia/ui/widgets/home/category_slide_item.dart';
import 'package:provider/provider.dart';

class CategoryScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseChangeNotifier<CategoriesProvider>(
      model: Provider.of<CategoriesProvider>(context),
      onModelReady: (model) => model.prepareData(),
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
                                    "See all (${model.categories.length})",
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
                          // arguments: model.categoryList,
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
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: model.categories == null ? 0 : model.categories.length,
              itemBuilder: (BuildContext context, int index) {
                Category category = model.categories[index];
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
        ],
      ),
    );
  }
}
