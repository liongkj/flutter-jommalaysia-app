import 'package:flutter/material.dart';
import 'package:jommalaysia/core/providers/base_provider.dart';

class Category extends BaseProvider {
  Category({
    @required this.categoryId,
    @required this.categoryName,
    @required this.categoryNameMs,
    @required this.categoryNameZh,
    @required this.subcategories,
  });

  final String categoryId;
  final String categoryName;
  final String categoryNameMs;
  final String categoryNameZh;
  final List<Category> subcategories;
}
