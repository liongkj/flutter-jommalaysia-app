import 'package:json_annotation/json_annotation.dart';

import 'category_path.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String categoryId;
  final String categoryName;
  final String categoryNameMs;
  final String categoryNameZh;
  final CategoryPath categoryPath;

  Category(
      {this.categoryId,
      this.categoryName,
      this.categoryNameMs,
      this.categoryNameZh,
      this.categoryPath});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
