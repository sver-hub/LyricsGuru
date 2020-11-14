import 'artist.dart';

class Album {
  static const TABLE_NAME = 'album';
  static const COLUMN_ID = '_id';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_COVER_URL = 'cover_url';
  static const COLUMN_ARTIST_ID = 'artist_id';
  static const COLUMN_RELEASE_DATE = 'release_date';
  static const COLUMNS = [
    COLUMN_ID,
    COLUMN_TITLE,
    COLUMN_COVER_URL,
    COLUMN_ARTIST_ID,
    COLUMN_RELEASE_DATE
  ];

  String id;
  String title;
  String coverUrl;
  String artistId;
  Artist artist;
  DateTime releaseDate;

  Album({this.id, this.title, this.coverUrl, this.artist, this.releaseDate});

  Album.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    title = map[COLUMN_TITLE];
    coverUrl = map[COLUMN_COVER_URL];
    artistId = map[COLUMN_ARTIST_ID];
    String date = map[COLUMN_RELEASE_DATE];
    final parsed =
        date.split(' ')[0].split('-').map((e) => int.parse(e)).toList();
    releaseDate = DateTime(parsed[0], parsed.length > 1 ? parsed[1] : null,
        parsed.length > 2 ? parsed[2] : null);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_TITLE: title,
      COLUMN_COVER_URL: coverUrl,
      COLUMN_ARTIST_ID: artist.id,
      COLUMN_RELEASE_DATE: releaseDate.toString()
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }

    return map;
  }
}
