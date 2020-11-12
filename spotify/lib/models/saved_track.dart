import 'package:json_annotation/json_annotation.dart';

import 'track.dart';

part 'saved_track.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SavedTrack {
  final DateTime addedAt;
  final Track track;

  SavedTrack(this.addedAt, this.track);

  factory SavedTrack.fromJson(Map<String, dynamic> json) =>
      _$SavedTrackFromJson(json);

  Map<String, dynamic> toJson() => _$SavedTrackToJson(this);
}
