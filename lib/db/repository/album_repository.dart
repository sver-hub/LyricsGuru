import 'package:lyrics_guru/busines_logic/models/album.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';

class AlbumRepository extends Repository<Album> {
  @override
  Future<List<Album>> getAll() async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db
        .query(Album.TABLE_NAME, columns: Album.COLUMNS);
    return queryData.map((e) => Album.fromMap(e));
  }

  @override
  Future<Album> getById(int id) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Album.TABLE_NAME,
        columns: Album.COLUMNS,
        where: '${Album.COLUMN_ID} = ?',
        whereArgs: [id]);

    if (queryData.length > 1) throw Exception('Bad DB');

    return Album.fromMap(queryData[0]);
  }

  @override
  Future<bool> save(Album model) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
