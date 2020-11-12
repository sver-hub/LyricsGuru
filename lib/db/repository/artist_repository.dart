import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';
import 'package:sqflite/sqflite.dart';

class ArtistRepository extends Repository<Artist> {
  @override
  Future<List<Artist>> getAll() async {
    List<Map<String, dynamic>> queryData =
        await DatabaseProvider.db.query(Artist.TABLE_NAME);
    return queryData.map((e) => Artist.fromMap(e)).toList();
  }

  @override
  Future<Artist> getById(int id) async {
    if (id == null) return null;

    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Artist.TABLE_NAME,
        where: '${Artist.COLUMN_ID} = ?',
        whereArgs: [id]);

    if (queryData.length > 1) throw Exception('Bad DB');
    if (queryData.length == 0) return null;

    return Artist.fromMap(queryData[0]);
  }

  @override
  Future<bool> save(Artist model) async {
    var map = model.toMap();
    int id = map[Artist.COLUMN_ID];
    Artist inDb = await getById(id);

    if (inDb == null) {
      int inserted = await DatabaseProvider.db.insert(Artist.TABLE_NAME, map);
      if (inserted != 1) throw Exception('Failed insert');
      return true;
    }

    int updated = await DatabaseProvider.db.update(Artist.TABLE_NAME, map,
        where: '${Artist.COLUMN_ID} = ?', whereArgs: [id]);
    if (updated != 1) throw Exception('Failed update');
    return true;
  }

  @override
  Future<int> getCount() async {
    var x = await DatabaseProvider.db
        .rawQuery('SELECT COUNT (*) from ${Artist.TABLE_NAME}');
    int count = Sqflite.firstIntValue(x);
    return count;
  }
}
