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

  Future<void> prepareData() async {
    _categoryList =
        await _categoryService.fetchCategories<List<Category>, Category>();
    List<Category> cat = [];
    List<Category> sub = [];
    _categoryList.forEach(
      (c) {
        if (c.categoryPath.subcategory == null) {
          cat.add(c);
        } else {
          sub.add(c);
        }
      },
    );
    _categories = cat;
    _subcategories = sub;
    notifyListeners();
  }

  List<Category> getSubcategory(Category cat) {
    var sub = _subcategories
        .where((c) => c.categoryPath.category == cat.categoryPath.category)
        .toList();
    return sub;
  }

  bool isComingSoon(Category cat) {
    return getSubcategory(cat).isEmpty;
  }
}
