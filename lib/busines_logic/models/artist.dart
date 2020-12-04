import 'package:quiver/core.dart';

class Artist {
  static const TABLE_NAME = 'artist';
  static const COLUMN_ID = '_id';
  static const COLUMN_NAME = 'name';
  static const COLUMN_THUMBNAIL_URL = 'thumbnail_url';
  static const COLUMNS = [COLUMN_ID, COLUMN_NAME, COLUMN_THUMBNAIL_URL];

  String id;
  String name;
  String thumbnailUrl;

  Artist({this.id, this.name, this.thumbnailUrl});

  Artist.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    name = map[COLUMN_NAME];
    thumbnailUrl = map[COLUMN_THUMBNAIL_URL];
  }

  bool operator ==(o) => o is Artist && o.id == id && o.name == name;

  int get hashCode => hash2(id.hashCode, name.hashCode);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_NAME: name,
      COLUMN_THUMBNAIL_URL: thumbnailUrl
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }

    return map;
  }
}
