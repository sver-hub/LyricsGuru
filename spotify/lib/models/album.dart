import 'package:json_annotation/json_annotation.dart';

import 'artist.dart';
import 'image.dart';

part 'album.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Album {
  final String id;
  final String name;
  final List<Artist> artists;
  final List<Image> images;

  Album(this.id, this.name, this.artists, this.images);

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
