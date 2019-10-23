import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/category_service.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoriesProvider({@required CategoryService categoryService})
      : _categoryService = categoryService;

  CategoryService _categoryService;

  List<Category> _categoryList, _categories = [], _subcategories = [];

  List<Category> get categories => [..._categories];
  List<Category> get subcategories => [..._subcategories];

  bool isComingSoon(Category cat) {
    return getSubcategory(cat).isEmpty;
  }

  Future<void> prepareData() async {
    await fetchCategories();
    _categoryList.forEach(
      (c) {
        if (c.categoryPath.subcategory == null) {
          _categories.add(c);
        } else {
          _subcategories.add(c);
        }
      },
    );
  }

  Future<void> fetchCategories() async {
    _categoryList =
        await _categoryService.fetchCategories<List<Category>, Category>();
    _categories.clear();
    _subcategories.clear();
  }

  List<Category> getSubcategory(Category cat) {
    return _subcategories
        .where((c) => c.categoryPath.category == cat.categoryPath.category)
        .toList();
  }
}
