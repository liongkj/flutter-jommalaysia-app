import 'package:json_annotation/json_annotation.dart';

import 'category_path.dart';
import 'image.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.categoryNameMs,
    this.categoryNameZh,
    this.categoryPath,
    this.categoryThumbnail,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  final String categoryId;
  final String categoryName;
  final String categoryNameMs;
  final String categoryNameZh;
  final CategoryPath categoryPath;
  final Image categoryThumbnail;

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
