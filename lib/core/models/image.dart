import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Image({this.url, this.thumbnailUrl});

  String url;
  String thumbnailUrl;
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
