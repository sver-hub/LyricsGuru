import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';

class TrackRepository extends Repository<Track> {
  @override
  Future<List<Track>> getAll() async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db
        .query(Track.TABLE_NAME, columns: Track.COLUMNS);
    return queryData.map((e) => Track.fromMap(e)).toList();
  }

  @override
  Future<Track> getById(int id) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Track.TABLE_NAME,
        columns: Track.COLUMNS,
        where: '${Track.COLUMN_ID} = ?',
        whereArgs: [id]);

    if (queryData.length > 1) throw Exception('Bad DB');

    return Track.fromMap(queryData[0]);
  }

  @override
  Future<bool> save(Track model) async {
    var map = model.toMap();
    int id = map[Track.COLUMN_ID];
    Track inDb = await getById(id);

    if (inDb == null) {
      int inserted = await DatabaseProvider.db.insert(Track.TABLE_NAME, map);
      if (inserted != 1) throw Exception('Failed insert');
      return true;
    }

    int updated = await DatabaseProvider.db.update(Track.TABLE_NAME, map,
        where: '${Track.COLUMN_ID} = ?', whereArgs: [id]);
    if (updated != 1) throw Exception('Failed update');
    return true;
  }

  Future<List<Track>> getAllByAlbumId(String albumId) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Track.TABLE_NAME,
        columns: Track.COLUMNS,
        where: '${Track.COLUMN_ALBUM_ID} = ?',
        whereArgs: [albumId]);

    if (queryData.length == 0) return null;

    return queryData.map((e) => Track.fromMap(e)).toList();
  }
}
