// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryPath _$CategoryPathFromJson(Map<String, dynamic> json) {
  return CategoryPath(
    category: json['category'] as String,
    subcategory: json['subcategory'] as String,
  );
}

Map<String, dynamic> _$CategoryPathToJson(CategoryPath instance) =>
    <String, dynamic>{
      'category': instance.category,
      'subcategory': instance.subcategory,
    };
