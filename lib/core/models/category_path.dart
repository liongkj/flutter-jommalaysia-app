import 'package:json_annotation/json_annotation.dart';

part 'category_path.g.dart';

@JsonSerializable()
class CategoryPath {
  CategoryPath({this.category, this.subcategory});

  factory CategoryPath.fromJson(Map<String, dynamic> json) =>
      _$CategoryPathFromJson(json);

  final String category;
  final String subcategory;

  Map<String, dynamic> toJson() => _$CategoryPathToJson(this);
}
