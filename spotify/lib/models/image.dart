import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
  final int height;
  final int width;
  final String url;

  Image(this.height, this.width, this.url);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
