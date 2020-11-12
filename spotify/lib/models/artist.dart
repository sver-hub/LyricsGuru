import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'artist.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Artist {
  final String id;
  final String name;
  final String href;
  // final Map<String, String> externalUrls;
  List<Image> images;

  Artist(this.id, this.name, this.images, this.href);

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
