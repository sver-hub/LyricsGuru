import 'package:quiver/core.dart';

import 'album.dart';

class Track {
  static const TABLE_NAME = 'track';
  static const COLUMN_ID = '_id';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_ALBUM_ID = 'album_id';
  static const COLUMN_LYRICS = 'lyrics';
  static const COLUMN_TRACK_NUMBER = 'track_number';
  static const COLUMNS = [
    COLUMN_ID,
    COLUMN_TITLE,
    COLUMN_ALBUM_ID,
    COLUMN_LYRICS,
    COLUMN_TRACK_NUMBER
  ];

  String id;
  String title;
  String albumId;
  Album album;
  String lyrics;
  int trackNumber;

  Track({this.id, this.title, this.album, this.trackNumber});

  Track.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    title = map[COLUMN_TITLE];
    albumId = map[COLUMN_ALBUM_ID];
    lyrics = map[COLUMN_LYRICS];
    trackNumber = map[COLUMN_TRACK_NUMBER];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_TITLE: title,
      COLUMN_ALBUM_ID: album.id,
      COLUMN_LYRICS: lyrics,
      COLUMN_TRACK_NUMBER: trackNumber
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }

    return map;
  }

  bool operator ==(o) => o is Track && o.id == id && o.title == title;
  int get hashCode => hash2(id.hashCode, title.hashCode);
}
