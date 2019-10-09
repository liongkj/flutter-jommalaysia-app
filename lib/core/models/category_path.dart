import 'package:json_annotation/json_annotation.dart';

part 'category_path.g.dart';

@JsonSerializable()
class CategoryPath {
  final String category;
  final String subcategory;
  CategoryPath({this.category, this.subcategory});

  factory CategoryPath.fromJson(Map<String, dynamic> json) =>
      _$CategoryPathFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryPathToJson(this);
}
