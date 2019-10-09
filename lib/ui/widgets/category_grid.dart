import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/providers/widgets/categories_provider.dart';
import 'package:jommalaysia/ui/widgets/base_widget.dart';
import 'package:provider/provider.dart';

import 'category_item.dart';

class CategoryGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<CategoriesProvider>(
      model: CategoriesProvider(
        categoryService: Provider.of(context),
      ),
      onModelReady: (model) => model.fetchCategories(),
      builder: (context, model, child) => model.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: model.categoryList.length,
              itemBuilder: (context, index) => CategoryItem(
                category: model.categoryList[index],
                onTap: () {},
              ),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
    );
  }
}
