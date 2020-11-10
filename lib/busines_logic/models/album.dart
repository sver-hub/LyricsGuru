import 'artist.dart';

class Album {
  static const TABLE_NAME = 'album';
  static const COLUMN_ID = '_id';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_COVER_URL = 'cover_url';
  static const COLUMNS = [COLUMN_ID, COLUMN_TITLE, COLUMN_COVER_URL];

  int id;
  String title;
  String coverUrl;
  Artist artist;

  Album({this.title, this.coverUrl, this.artist});

  Album.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    title = map[COLUMN_TITLE];
    coverUrl = map[COLUMN_COVER_URL];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_TITLE: title,
      COLUMN_COVER_URL: coverUrl
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }

    return map;
  }
}
