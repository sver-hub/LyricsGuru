import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';

class TrackRepository extends Repository<Track> {
  @override
  Future<List<Track>> getAll() async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db
        .query(Track.TABLE_NAME, columns: Track.COLUMNS);
    return queryData.map((e) => Track.fromMap(e));
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
  Future<bool> save(Track model) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
