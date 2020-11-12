// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track(
    json['id'] as String,
    json['name'] as String,
    json['album'] == null
        ? null
        : Album.fromJson(json['album'] as Map<String, dynamic>),
    (json['artists'] as List)
        ?.map((e) =>
            e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'album': instance.album?.toJson(),
      'artists': instance.artists?.map((e) => e?.toJson())?.toList(),
    };
