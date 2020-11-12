import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist.dart';

part 'track.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Track {
  final String id;
  final String name;
  final Album album;
  final List<Artist> artists;

  Track(this.id, this.name, this.album, this.artists);

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
