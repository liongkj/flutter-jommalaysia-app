import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';
import 'package:jommalaysia/core/services/category_service.dart';

class CategoriesProvider extends BaseProvider {
  CategoriesProvider({@required CategoryService categoryService})
      : _categoryService = categoryService;

  CategoryService _categoryService;

  List<Category> categoryList, categories = [], subcategories = [];
  bool IsComingSoon = false;

  bool isComingSoon(Category cat) {
    return getSubcategory(cat).isEmpty;
  }

  Future<bool> prepareData() async {
    setState(ViewState.busy);
    await fetchCategories();
    categoryList.forEach(
      (c) {
        if (c.categoryPath.subcategory == null) {
          categories.add(c);
        } else {
          subcategories.add(c);
        }
      },
    );
    setState(ViewState.idle);
    return true;
  }

  Future<void> fetchCategories() async {
    categoryList =
        await _categoryService.fetchCategories<List<Category>, Category>();
  }

  List<Category> getSubcategory(Category cat) {
    return subcategories
        .where((c) => c.categoryPath.category == cat.categoryPath.category)
        .toList();
  }
}
