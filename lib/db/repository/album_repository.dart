import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';
import 'package:sqflite/sqflite.dart';

class AlbumRepository extends Repository<Album> {
  @override
  Future<List<Album>> getAll() async {
    List<Map<String, dynamic>> queryData =
        await DatabaseProvider.db.query(Album.TABLE_NAME);
    return queryData.map((e) => Album.fromMap(e)).toList();
  }

  @override
  Future<Album> getById(String id) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Album.TABLE_NAME,
        where: '${Album.COLUMN_ID} = ?',
        whereArgs: [id]);

    if (queryData.length > 1) throw Exception('Bad DB');
    if (queryData.length == 0) return null;

    return Album.fromMap(queryData[0]);
  }

  @override
  Future<bool> save(Album model) async {
    var map = model.toMap();
    final id = map[Album.COLUMN_ID];
    Album inDb = await getById(id);

    if (inDb == null) {
      int inserted = await DatabaseProvider.db.insert(Album.TABLE_NAME, map);
      if (inserted < 1) throw Exception('Failed insert');
      return true;
    }

    int updated = await DatabaseProvider.db.update(Album.TABLE_NAME, map,
        where: '${Album.COLUMN_ID} = ?', whereArgs: [id]);
    if (updated < 1) throw Exception('Failed update');
    return true;
  }

  Future<List<Album>> getAllByArtistId(String artistId) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Album.TABLE_NAME,
        where: '${Album.COLUMN_ARTIST_ID} = ?',
        whereArgs: [artistId]);

    if (queryData.length == 0) return null;

    return queryData.map((e) => Album.fromMap(e)).toList();
  }

  @override
  Future<int> getCount() async {
    var x = await DatabaseProvider.db
        .rawQuery('SELECT COUNT (*) from ${Album.TABLE_NAME}');
    int count = Sqflite.firstIntValue(x);
    return count;
  }
}
