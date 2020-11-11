import 'album.dart';

class Track {
  static const TABLE_NAME = 'track';
  static const COLUMN_ID = '_id';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_ALBUM_ID = 'album_id';
  static const COLUMN_LYRICS = 'lyrics';
  static const COLUMNS = [
    COLUMN_ID,
    COLUMN_TITLE,
    COLUMN_ALBUM_ID,
    COLUMN_LYRICS
  ];

  String id;
  String title;
  String albumId;
  Album album;
  String lyrics;

  Track({this.id, this.title, this.album});

  Track.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    title = map[COLUMN_TITLE];
    albumId = map[COLUMN_ALBUM_ID];
    lyrics = map[COLUMN_LYRICS];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_TITLE: title,
      COLUMN_ALBUM_ID: album.id,
      COLUMN_LYRICS: lyrics
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }

    return map;
  }
}
