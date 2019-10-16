import 'package:flutter/material.dart';
import 'package:jommalaysia/core/enums/viewstate.dart';
import 'package:jommalaysia/core/models/category.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';
import 'package:jommalaysia/core/services/category_service.dart';

class CategoriesProvider extends BaseProvider {
  CategoriesProvider({@required CategoryService categoryService})
      : _categoryService = categoryService;

  CategoryService _categoryService;

  List<Category> categoryList;

  Future<bool> fetchCategories() async {
    setState(ViewState.busy);
    categoryList =
        await _categoryService.fetchCategories<List<Category>, Category>();
    setState(ViewState.idle);
    return true;
  }
}
