import 'package:json_annotation/json_annotation.dart';

import 'category_path.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category(
      {this.categoryId,
      this.categoryName,
      this.categoryNameMs,
      this.categoryNameZh,
      this.categoryPath});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  final String categoryId;
  final String categoryName;
  final String categoryNameMs;
  final String categoryNameZh;
  final CategoryPath categoryPath;

  String get image => null;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
