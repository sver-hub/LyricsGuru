import 'package:lyrics_guru/busines_logic/models/track.dart';
import 'package:lyrics_guru/busines_logic/models/word.dart';
import 'package:lyrics_guru/db/database.dart';
import 'package:lyrics_guru/db/repository/repository.dart';
import 'package:sqflite/sqflite.dart';

class WordRepository extends Repository<Word> {
  @override
  Future<List<Word>> getAll() async {
    List<Map<String, dynamic>> queryData =
        await DatabaseProvider.db.query(Word.TABLE_NAME);
    return queryData.map((e) => Word.fromMap(e)).toList();
  }

  @override
  Future<Word> getById(String word) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Word.TABLE_NAME,
        where: '${Word.COLUMN_WORD} = ?',
        whereArgs: [word]);

    if (queryData == null || queryData.length == 0) return null;
    if (queryData.length > 1) throw Exception('Bad DB');

    return Word.fromMap(queryData[0]);
  }

  @override
  Future<bool> save(Word model) async {
    final map = model.toMap();
    final word = map[Word.COLUMN_WORD];
    Word inDb = await getById(word);

    if (inDb == null) {
      int inserted = await DatabaseProvider.db.insert(Word.TABLE_NAME, map);
      if (inserted < 1) throw Exception('Failed insert');
      return true;
    }

    int updated = await DatabaseProvider.db.update(Word.TABLE_NAME, map,
        where: '${Word.COLUMN_WORD} = ?', whereArgs: [word]);
    if (updated < 1) throw Exception('Failed update');
    return true;
  }

  @override
  Future<int> getCount() async {
    var x = await DatabaseProvider.db
        .rawQuery('SELECT COUNT (*) from ${Word.TABLE_NAME}');
    int count = Sqflite.firstIntValue(x);
    return count;
  }

  Future<List<String>> getFeaturedTrackIds(String word) async {
    List<Map<String, dynamic>> queryData = await DatabaseProvider.db.query(
        Word.TABLE_NAME + '_' + Track.TABLE_NAME,
        columns: [Track.TABLE_NAME + Track.COLUMN_ID],
        where: '${Word.COLUMN_WORD} = ?',
        whereArgs: [word]);
    return queryData.map((e) => e[Track.TABLE_NAME + Track.COLUMN_ID]).toList();
  }

  Future<bool> saveFeature(String word, String trackId) async {
    final queryRes = await DatabaseProvider.db.query(
        Word.TABLE_NAME + '_' + Track.TABLE_NAME,
        where:
            '${Word.COLUMN_WORD} = ? AND ${Track.TABLE_NAME}${Track.COLUMN_ID} = ?',
        whereArgs: [word, trackId]);

    if (queryRes == null || queryRes.length == 0) {
      final map = {
        '${Word.COLUMN_WORD}': word,
        '${Track.TABLE_NAME}${Track.COLUMN_ID}': trackId,
      };
      int inserted = await DatabaseProvider.db
          .insert(Word.TABLE_NAME + '_' + Track.TABLE_NAME, map);
      if (inserted < 1) return false;
    }
    return true;
  }
}
