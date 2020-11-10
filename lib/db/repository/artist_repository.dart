import 'package:lyrics_guru/busines_logic/models/artist.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';

class ArtistRepository extends Repository<Artist> {
  @override
  Future<List<Artist>> getAll() async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db
        .query(Artist.TABLE_NAME, columns: Artist.COLUMNS);
    return queryData.map((e) => Artist.fromMap(e));
  }

  @override
  Future<Artist> getById(int id) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Artist.TABLE_NAME,
        columns: Artist.COLUMNS,
        where: '${Artist.COLUMN_ID} = ?',
        whereArgs: [id]);

    if (queryData.length > 1) throw Exception('Bad DB');

    return Artist.fromMap(queryData[0]);
  }

  @override
  Future<bool> save(Artist model) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
