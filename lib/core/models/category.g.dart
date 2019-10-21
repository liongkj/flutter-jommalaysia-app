// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    categoryId: json['categoryId'] as String,
    categoryName: json['categoryName'] as String,
    categoryNameMs: json['categoryNameMs'] as String,
    categoryNameZh: json['categoryNameZh'] as String,
    categoryPath: json['categoryPath'] == null
        ? null
        : CategoryPath.fromJson(json['categoryPath'] as Map<String, dynamic>),
    image: json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryNameMs': instance.categoryNameMs,
      'categoryNameZh': instance.categoryNameZh,
      'categoryPath': instance.categoryPath,
      'image': instance.image,
    };
