// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedTrack _$SavedTrackFromJson(Map<String, dynamic> json) {
  return SavedTrack(
    json['added_at'] == null
        ? null
        : DateTime.parse(json['added_at'] as String),
    json['track'] == null
        ? null
        : Track.fromJson(json['track'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SavedTrackToJson(SavedTrack instance) =>
    <String, dynamic>{
      'added_at': instance.addedAt?.toIso8601String(),
      'track': instance.track?.toJson(),
    };
